# frozen_string_literal: true

module API
  module V2
    module Public
      module Entities
        class Member < API::V2::Entities::Base
          expose(
            :username,
            documentation: {
              desc: 'name of member',
              type: String
            }
          )
        end
      end
    end
  end
end
