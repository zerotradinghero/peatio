# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Entities
      class Advertisement < Base
        expose(
          :id,
          documentation: {
            type: Integer,
            desc: "Price for each unit. e.g."\
                  "If you want to sell/buy 1 btc at 3000 usd, the price is '3000.0'"
          }
        )

      	expose(
          :price,
          documentation: {
            type: BigDecimal,
            desc: "Price for each unit. e.g."\
                  "If you want to sell/buy 1 btc at 3000 usd, the price is '3000.0'" 
          }
        )

        expose(
          :expired_time,
          documentation: {
            desc: 'expired_time'
          }
        )

        expose(
          :advertis_type,
          documentation: {
            type: Integer,
            desc: "sell/buy"
          }
        )

        expose(
          :coin_avaiable,
          documentation: {
            type: BigDecimal,
            desc: "sell/buy how many coin?"
          }
        )

        expose(
          :upper_limit,
          documentation: {
            type: BigDecimal,
            desc: "sell/buy how many max money?"
          }
        )

        expose(
          :lower_limit,
          documentation: {
            type: BigDecimal,
            desc: "sell/buy how many min money?"
          }
        )

        expose(
          :description,
          documentation: {
            type: String,
            desc: "description of sell/buy"
          }
        )

        expose(
          :currency,
          :using => API::V2::Public::Entities::Currency,
          documentation: {
            desc: 'Currency.'
          }
        )

        expose(
          :creator_id,
          documentation: {
            desc: 'name of creator.'
          }
        )

        expose(
          :payment_methods,
          using: API::V2::P2p::Entities::PaymentMethod,
          documentation: {
            type: 'API::V2::Public::Entities::PaymentMethod',
            is_array: true,
            uniq: true,
            desc: 'Payment info of member'
          },
          ) do |c|
          c.payment_methods
        end

        expose(
          :currency_payment_id,
          documentation: {
            desc: 'currency payment id'
          }
        )

        expose(
          :price_type,
          documentation: {
            desc: 'currency'
          }
        )

        expose(
          :total_amount,
          documentation: {
            desc: 'total amount'
          }
        )

      end
    end
  end
end
