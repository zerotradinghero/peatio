# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Entities
      class P2pOrder < Base
        expose(
          :id,
          documentation: {
            type: Integer,
            desc: "id of p2p order."
          }
        )

        expose(
          :p2p_orders_type,
          documentation: {
            type: Integer,
            desc: "type of p2p order."
          }
        )

        expose(
          :price,
          documentation: {
            type: BigDecimal,
            desc: "price of p2p order."
          }
        )

        expose(
          :ammount,
          documentation: {
            type: BigDecimal,
            desc: "amount of p2p order."
          }
        )

        expose(
          :number_of_coin,
          documentation: {
            type: BigDecimal,
            desc: "number_of_coin of p2p order."
          }
        )

        expose(
          :order_number,
          documentation: {
            type: String,
            desc: "order number of p2p order."
          }
        )

        expose(
          :created_at,
          documentation: {
            type: String,
            desc: "created at of p2p order."
          }
        )

        expose(
          :advertisement ,
          :using => API::V2::Entities::Advertisement,
          documentation: {
            desc: 'name of creator.'
          }
        )


      end
    end
  end
end
