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
          return error!({ errors: ['p2p_order_claim.not_found!'] }, 404)
        end
        if P2pOrderClaim.create_claim(order, params)
          present "Create claim order success!"
        else
          return error!({ errors: ['p2p_order_claim.create_failed!'] }, 412)
        end

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
        return error!({ errors: ['p2p_order_claim.not_found!'] }, 404) unless claim
        present claim, with: API::V2::P2p::Entities::P2pOrderClaim
      end

      #---------------------------------------------------------------------
      desc 'Update Claim',
           is_array: true,
           success: API::V2::P2p::Entities::P2pOrderClaim
      params do
        use :p2p_claim_update
      end

      post '/claim/:id' do
        claim = P2pOrderClaim.find_by id: params[:id]
        return error!({ errors: ['p2p_order_claim.not_found!'] }, 404) unless claim

        claim.reason = params[:reason]
        claim.description = params[:description]
        claim.status = params[:status]
        params[:images].each do |image|
          claim.attachments.update(image: image)
        end
        if claim.save
          present claim, with: API::V2::P2p::Entities::P2pOrderClaim
        else
          return error!({ errors: ['p2p_order_claim.create_failed!'] }, 412)
        end
      end

      #--------------------------------------------------------------------------

    end
  end
end
