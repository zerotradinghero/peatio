# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class Advertisements < Grape::API
      helpers ::API::V2::P2p::NamedParams
      helpers ::API::V2::ParamHelpers

      desc 'Get all Advertis and search',
           is_array: true,
           success: API::V2::Entities::Advertisement
      params do
        use :pagination
        optional :advertis_type,
                 type: String,
                 values: { value: %w[sell buy], message: 'public.advertis.invalid_type' },
                 desc: -> { API::V2::Entities::Advertisement.documentation[:advertis_type][:desc] }
        optional :currency_id,
                 type: String
        optional :currency_payment_id,
                 type: String
        optional :page,
                 type: String
        optional :search, type: JSON, default: {} do
          optional :location,
                   type: String,
                   desc: 'Search by location using SQL LIKE'
          optional :amount,
                   type: BigDecimal,
                   desc: 'Search by amount using SQL <='
          optional :payment_method,
                   type: String,
                   desc: 'Search by payment method SQL'
        end
      end
      get '/advertises' do
        search_attrs = { m: 'or' }

        present paginate(Rails.cache.fetch("advertis_#{params}_p2p", expires_in: 6) do

          result = Advertisement.send(params[:advertis_type] || "sell").enabled.order('created_at DESC')
          result = result.where(currency_id: params[:currency_id]) if params[:currency_id].present?
          result = result.where(currency_payment_id: params[:currency_payment_id]) if params[:currency_payment_id].present?
          result = result.ransack(search_attrs)
          if Advertisement.buy
            result = result.result.load.to_a.select { |adv| current_user.is_quantified_to_trade?(adv.creator_id) && current_user.is_enough_time_registration?(adv.member_registration_day.to_i) &&
              current_user.is_hold_enough_coin?(adv.member_coin_number.to_i) && current_user.is_kyc? }
          else
            result = result.result.load.to_a.select { |adv| current_user.is_quantified_to_trade?(adv.creator_id) }
          end
          result
        end), with: API::V2::Entities::Advertisement
      end

      desc 'Create advertisement',
           is_array: true,
           success: API::V2::Entities::Advertisement
      params do
        use :param_advertisement
      end
      post '/advertisements' do
        balance = current_user.accounts.where(currency_id: params[:advertisement][:currency_id]).first.try(:balance)
        if balance.to_f < 0
          return present "balance not enough"
        end

        if params[:payment_method_ids].count > 5
          return present "payment method limit 5"
        end

        unless Currency.find_by id: params[:advertisement][:currency_id]
          return present "currency not found!"
        end

        unless Currency.find_by id: params[:advertisement][:currency_payment_id]
          return present "currency payment not found!"
        end

        advertisement = Advertisement.new(params[:advertisement])
        advertisement.creator_id = current_user.id
        params[:payment_method_ids].each do |payment_method_id|
          unless PaymentMethod.find_by id: payment_method_id
            return present "payment method #{payment_method_id} not found"
          end
          advertisement.advertisement_payment_methods << AdvertisementPaymentMethod.new(payment_method_id: payment_method_id)
        end

        if !current_user.is_kyc?
          return present "you must verify your identity"
        end

        if advertisement.valid?
          advertisement.save

          present advertisement, with: API::V2::Entities::Advertisement
        else
          present advertisement.errors.full_messages.join(',')
        end

      end

    end
  end
end
