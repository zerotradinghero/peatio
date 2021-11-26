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

      end
    end
  end
end
