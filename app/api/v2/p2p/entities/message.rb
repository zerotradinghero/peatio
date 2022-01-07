# frozen_string_literal: true

module API
  module V2
    module P2p
      module Entities
        class Message < API::V2::Entities::Base
          expose(:id)
          expose(:content)
          expose(:member_id)
          expose(:created_at)
          expose(
            :attachments,
            using: API::V2::P2p::Entities::Attachment,
            documentation: {
              type: 'API::V2::P2p::Entities::Attachment',
              is_array: true,
              uniq: true,
              desc: 'images at of Claim',
              type: String
            }
          )
        end
      end
    end
  end
end
