# frozen_string_literal: true

module API
  module V2
    module Public
      module Entities
        class PaymentMethod < API::V2::Entities::Base
          expose(
            :payment_type,
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
