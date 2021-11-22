# frozen_string_literal: true

module API::V2
  module P2p
    class Mount < Grape::API
      before { authenticate! }
      before { set_ets_context! }

      mount P2p::Advertises
    end
  end
end
