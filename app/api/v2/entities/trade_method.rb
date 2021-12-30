# frozen_string_literal: true

module API
  module V2
    module Entities
      class TradeMethod < API::V2::Entities::Base
        expose(
          :id,
          documentation: {
            desc: 'ID of trade method',
            type: Integer
          }
        )

        expose(
          :name,
          documentation: {
            desc: 'name of trade method',
            type: String
          }
        )

        expose(
          :icon,
          documentation: {
            desc: 'icon of trade method',
            type: String
          }
        )

        expose(
          :type_code,
          documentation: {
            desc: 'type code of trade method',
            type: String
          }
        )
      end
    end
  end
end
