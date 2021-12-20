# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class P2pOrders < Grape::API
      helpers ::API::V2::P2p::NamedParams
      helpers ::API::V2::ParamHelpers

      desc 'Create P2p order',
           is_array: true,
           success: API::V2::Entities::P2pOrder
      params do
        use :p2p_order
      end
      post '/p2p_orders' do
        user_authorize! :create, ::P2pOrder
        advertis = Advertisement.find_by id: params[:advertisement_id]
        order = P2pOrder.build_order(params, advertis, current_user)
        message = order.send_message("This order has been ordered", order.advertisement.creator)

        present :response_message, message

        unless order.save
          return present "Order create unsuccessful"
        end

        if order.sell?
          return present "Please enter a valid amount less than the amount #{advertis.coin_avaiable}" if params[:number_of_coin] > advertis.coin_avaiable
          account = advertis.creator.accounts.where(currency_id: advertis.currency_id).first
        elsif order.buy?
          account = order.member.accounts.where(currency_id: advertis.currency_id).first
        end
        account.lock_funds(order.number_of_coin)

        present :order, order, with: API::V2::Entities::P2pOrder
      end
      desc 'Edit P2p order',
           is_array: true,
           success: API::V2::Entities::P2pOrder
      params do
        use :p2p_edit
      end

      post '/p2p_order/:id' do
        order = P2pOrder.find_by id: params[:id]
        if order.blank?
          return present "Order not found"
        end
        payment_method_ids = order.advertisement.advertisement_payment_methods.pluck(:payment_method_id)
        unless payment_method_ids.include?(params[:payment_method_id])
          return present "Invalid payment method"
        end
        if order.cancel? && params[:status] == "transfer"
          return present "cannot update because order is exp!"
        end

        if order.update(params)
          present :response_message, order.send_message_status
          present :order, order, with: API::V2::Entities::P2pOrder
        else
          present "update fail!"
        end
      end

      desc 'List P2p order',
           is_array: true,
           success: API::V2::Entities::P2pOrder
      params do
        use :pagination
      end
      get '/member/p2p_orders' do
        present paginate(Rails.cache.fetch("member_order_list_#{current_user.id}", expires_in: 600) do
          order = P2pOrder.joins(:advertisement).where("advertisements.creator_id = ? OR p2p_orders.member_id = ?", current_user.id, current_user.id).order('p2p_orders.created_at DESC')
          order.to_a
        end), with: API::V2::Entities::P2pOrder
      end

      desc 'Show P2p order',
           is_array: true,
           success: API::V2::Entities::P2pOrder
      get '/p2p_order/:id' do
        order = P2pOrder.find_by id: params[:id]
        unless order
          return present 'id not found!'
        end
        present order, with: API::V2::Entities::P2pOrder
      end

      desc 'GET form P2p order claim',
           is_array: true,
           success: API::V2::Entities::P2pOrder
      get '/p2p_order/:id/claim' do
        order = P2pOrder.find_by id: params[:id]
        unless order
          return present 'id not found!'
        end
        present order, with: API::V2::Entities::P2pOrder
      end

      desc 'Admin show list P2p order',
           is_array: true,
           success: API::V2::Entities::P2pOrder

      get '/admin/:id/p2p_orders' do
        P2pOrder.all.where(member_id: params[:member_id])
      end

      desc 'Clain P2p order',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      params do
        use :p2p_claim
      end

      post '/p2p_order/:id/claim' do
        order = P2pOrder.find_by id: params[:id]
        order.claim_title = params[:claim_title]
        order.claim_description = params[:claim_description]
        order.claim_status = "request"
        params[:claim_images].each do |image|
          order.images.attach(image)
          return present order.images.attached?
        end
        # order.save
        # return present order, with: API::V2::P2p::Entities::P2pOrderClaim
          # return present order
          # if params[:images]
          #   params[:images].each do |image|
          #     file_path = "/public/" + i[:file_name]
          #     image_path = Rails.root + file_path
          #     image_file = File.new(image_path)
          #     order.images.attach(image)
          #     order.save
          #   end
          # end
      end

      desc 'Admin list clain P2pOrder',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      params do
        use :p2p_list_claim
      end

      get '/admin/p2p_order/claims' do
        list_order_claim = P2pOrder.request
        present list_order_claim, with: API::V2::P2p::Entities::P2pOrderClaim
      end

      desc 'Admin show clain P2pOrder',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      params do
        use :p2p_show_claim
      end

      get '/admin/p2p_orders/:id/claim' do
        order = P2pOrder.find_by id: params[:id]
        if order.claim_status
          present order, with: API::V2::P2p::Entities::P2pOrderClaim
        else
          return present "Claim not found!"
        end
      end

      desc 'Admin approve order',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      params do
        use :p2p_admin_approve
      end

      post '/admin/p2p_orders/:id/approve' do
        order = P2pOrder.find_by id: params[:id]
        if order.status == 'paid'
          if order.update(params)
            present :complete_order, order.successful_p2porder_transfer
            order.update(status: :complete)
            present :response_message, order.send_message_status
            present :order, order
          else
            present "update fail!"
          end
        else
          present "order has not been paid"
        end
      end
    end
  end
end
