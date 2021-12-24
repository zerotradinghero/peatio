# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class P2pOrderClaims < Grape::API
      helpers ::API::V2::P2p::NamedParams
      helpers ::API::V2::ParamHelpers

      #------------------------------------------------------
      desc 'Create P2p order claim',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      params do
        use :p2p_claim
      end

      post '/p2p_order/:id/claim' do
        order = P2pOrder.find_by id: params[:id]
        unless order
          return present "p2p order not found!"
        end
        P2pOrderClaim.create_claim(order, params)
        present "Create claim success!"
      end

      #----------------------------------------------------------
      desc 'List claim P2pOrder',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      get '/claims' do
        if current_user.admin?
          list_order_claim = P2pOrderClaim.request.order(updated_at: :desc)
        else
          list_order_claim = P2pOrderClaim.request.where(member_id: current_user.id)
                                          .or.where(creator_adv_id: current_user.id)
                                          .order(updated_at: :desc)
        end
        present list_order_claim, with: API::V2::P2p::Entities::P2pOrderClaim
      end

      #---------------------------------------------------------------
      desc 'Show claim',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      get '/claim/:claim_id' do
        claim = P2pOrderClaim.find_by id: params[:claim_id]
        return present "Claim not found!" unless claim
        present claim, with: API::V2::P2p::Entities::P2pOrderClaim
      end
      #---------------------------------------------------------------------
      desc 'Update Claim',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      params do
        # use :p2p_show_claim
      end

      put '/claim/:claim_id' do
        claim = P2pOrderClaim.find_by id: params[:claim_id]
        return present "Claim not found!" unless claim
        present claim, with: API::V2::P2p::Entities::P2pOrderClaim
      end

      #--------------------------------------------------------------------------

    end
  end
end
