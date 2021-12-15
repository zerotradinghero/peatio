# frozen_string_literal: true

module API
  module V2
    module P2p
      module Entities
        class P2pOrderClaim < API::V2::Entities::Base
          expose(
            :id,
            documentation: {
              desc: 'id of P2pOrder',
              type: String
            }
          )

          expose(
            :claim_title,
            documentation: {
              desc: 'claim title of P2pOrder',
              type: String
            }
          )

          expose(
            :claim_description,
            documentation: {
              desc: 'claim description of P2pOrder',
              type: String
            }
          )

          expose(
            :claim_status,
            documentation: {
              desc: 'claim status of P2pOrder',
              type: Integer
            }
          )

          expose(
            :order_number,
            documentation: {
              desc: 'order_number of P2pOrder',
              type: String
            }
          )

          expose(
            :images,
            documentation: {
              desc: 'images at of P2pOrder',
              type: String
            }
          )

          expose(
            :created_at,
            documentation: {
              desc: 'created at of P2pOrder',
              type: String
            }
          )
        end
      end
    end
  end
end
