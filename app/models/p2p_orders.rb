# frozen_string_literal: true

class P2pOrder < ApplicationRecord
  belongs_to :advertisement
  belongs_to :payment_method

  enum status: [:ordered, :paid, :complete, :cancel]
  enum p2p_orders_type: [:sell, :buy]

  def self.create_order(params)
    advertis = Advertisement.find(params[:advertisement_id])
    order = new(params)
    order.price = advertis.price
    order.ammount = order.number_of_coin * order.price
    order.order_number = SecureRandom.hex(6)
    order.save
    order
  end

end
