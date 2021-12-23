# frozen_string_literal: true
module API
  module V2
    module P2p
      module Entities
        class Attachment < API::V2::Entities::Base

          expose(
            :image,
            documentation: {
              desc: 'balance of account',
              type: String
            }
          )
        end
      end
    end
  end
end
