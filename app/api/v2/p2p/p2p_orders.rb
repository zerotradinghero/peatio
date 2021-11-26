# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class P2pOrders < Grape::API
      helpers ::API::V2::P2p::NamedParams

      desc 'Create P2p order',
           is_array: true,
           success: API::V2::Entities::P2pOrder
      params do
        use :p2p_order
      end
      post '/p2p_orders' do
        user_authorize! :create, ::P2pOrder

        order = P2pOrder.create_order(params)
        present order, with: API::V2::Entities::Order
      end
    end
  end
end
