# frozen_string_literal: true

module API
  module V2
    module P2p
      module Entities
        class PaymentMethod < API::V2::Entities::Base
          expose(
            :id,
            documentation: {
              desc: 'ID of payment',
              type: Integer
            }
          )

          expose(
            :payment_type,
            documentation: {
              desc: 'Type of payment',
              type: String
            }
          )

          expose(
            :account_number,
            documentation: {
              desc: 'Type of payment',
              type: String
            }
          )

          expose(
            :bank_name,
            documentation: {
              desc: 'Type of payment',
              type: String
            }
          )

          expose(
            :account_name,
            documentation: {
              desc: 'Type of payment',
              type: String
            }
          )
        end
      end
    end
  end
end
