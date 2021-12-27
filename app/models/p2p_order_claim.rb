# frozen_string_literal: true

class P2pOrderClaim < ApplicationRecord

  has_many :attachments, as: :object
  belongs_to :member
  belongs_to :p2p_order

  enum status: [:request, :approve, :canceled]
  enum claim_type: [:buyer, :seller]

  def self.create_claim(order, params)
    claim = P2pOrderClaim.new(p2p_order_id: order.id)
    claim.creator_adv_id = order.advertisement.creator_id
    claim.member_id = order.member_id
    claim.reason = params[:reason]
    claim.claim_type = get_claim_type(order)
    claim.description = params[:description]
    claim.status = "request"
    params[:claim_images].each do |image|
      claim.attachments.new(image: image)
    end
    claim.save
  end

  def order_number
    p2p_order.order_number
  end

  private

  def get_claim_type(order)
    type_else = order.p2p_order_type == "sell" ? "sell" : "buy"
    creator_adv_id == member_id ? (order.p2p_order_type + 'er') :  (type_else + "er")
  end
end