# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module P2p
      module NamedParams
        extend ::Grape::API::Helpers

        params :p2p_order do
          requires :p2p_orders_type,
                   type: String,
                   values: { value: %w(sell buy), message: 'p2p.p2p_order.invalid_p2p_order_type' },
                   desc: -> { V2::Entities::P2pOrder.documentation[:p2p_orders_type] }
          requires :advertisement_id,
                   type: Integer,
                   values: { value: -> (v) { (Advertisement.find_by id: v).present? }, message: 'p2p.p2p_order.non_advertisement' },
                   desc: -> { V2::Entities::P2pOrder.documentation[:advertisement_id] }
          requires :number_of_coin,
                   type: BigDecimal,
                   values: { value: -> (v) { v.try(:positive?) }, message: 'p2p.p2p_order.non_positive_number_of_coin' },
                   desc: -> { V2::Entities::P2pOrder.documentation[:number_of_coin] }
        end

        params :p2p_edit do
          optional :status,
                   type: String,
                   values: { value: %w(ordered paid complete cancel), message: 'p2p.p2p_order.invalid_p2p_status' },
                   desc: -> { V2::Entities::P2pOrder.documentation[:status] }

          optional :payment_method_id,
                   type: Integer
        end
      end
    end
  end
end
