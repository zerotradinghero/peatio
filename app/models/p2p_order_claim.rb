# frozen_string_literal: true

class P2pOrderClaim < ApplicationRecord

  has_many :attachments, as: :object
  belongs_to :member
  belongs_to :p2p_order

  enum status: [:request, :approve, :canceled]
  enum claim_type: [:buyer, :seller]

  before_update :release_coin_approve

  scope :status_ordered, ->{
    order(<<-SQL)
    CASE p2p_order_claims.status 
    WHEN 0 THEN 'a' 
    WHEN 1 THEN 'b'
    WHEN 2 THEN 'c' 
    END ASC, 
    updated_at DESC
    SQL
  }

  def release_coin_approve
    if status_changed? && approve?
      p2p_order.update(status: :paid)
    end
  end

  def self.create_claim(order, params, current_user)
    claim = P2pOrderClaim.new(p2p_order_id: order.id)
    claim.creator_adv_id = order.advertisement.creator_id
    claim.member_id = current_user.id
    claim.reason = params[:reason]
    claim.claim_type = claim.get_claim_type(order)
    claim.description = params[:description]
    claim.status = "request"
    (params[:claim_images] || []).each do |image|
      claim.attachments.new(image: image, member_id: current_user.id)
    end
    claim.save
  end

  def order_number
    p2p_order.order_number
  end

  def get_claim_type(order)
    type_else = order.p2p_orders_type == "sell" ? "sell" : "buy"
    creator_adv_id == member_id ? (order.p2p_orders_type + 'er') :  (type_else + "er")
  end

  def reason_claim
    p2p_order.reason_claim
  end
end