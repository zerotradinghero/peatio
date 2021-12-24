# frozen_string_literal: true

class P2pOrderClaim < ApplicationRecord

  has_many :attachments, as: :object
  belongs_to :member
  belongs_to :p2p_order

  enum status: [:request, :approve, :canceled]

  def self.create_claim(order, params)
    claim = P2pOrderClaim.new(p2p_order_id: order.id)
    claim.creator_adv_id = order.advertisement.creator_id
    claim.reason = params[:reason]
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
end