# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class Advertisements < Grape::API
      helpers ::API::V2::P2p::NamedParams

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
