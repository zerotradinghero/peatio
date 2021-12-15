# frozen_string_literal: true

module API
  module V2
    module P2p
      module Entities
        class Account < API::V2::Entities::Base

          expose(
            :currency_id,
            documentation: {
              desc: 'balance of account',
              type: String
            }
          )

          expose(
            :balance,
            documentation: {
              desc: 'balance of account',
              type: BigDecimal
            }
          )

        end
      end
    end
  end
end
