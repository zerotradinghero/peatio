# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class Message < Grape::API
      helpers ::API::V2::P2p::NamedParams
      helpers ::API::V2::ParamHelpers

      desc 'Create Message',
           is_array: true,
           success: API::V2::P2p::Entities::Message
      post 'order/:id/new_message' do
        order = P2pOrder.find_by(id: params[:id])
        unless order
          return error!({ errors: ['p2p_orders.not_found'] }, 404)
        end
        order.messages.create(member_id: current_user.id, content: params[:content], p2p_order_id: params[:id])
        present "create success!"
      end

      #-------------------------------------------------------------------------------------------------------------
      desc 'List Message',
           is_array: true,
           success: API::V2::P2p::Entities::Message
      get '/order/:id/messages' do
        order = P2pOrder.find_by(id: params[:id])
        unless order
          return error!({ errors: ['p2p_orders.not_found'] }, 404)
        end
        message = order.messages.order(created_at: :desc).page(params[:page] || 1).per(params[:limit] || 10)
        present message, with: API::V2::P2p::Entities::Message
      end
    end
  end
end
