# frozen_string_literal: true

class AdvertisPaymentMethod < ApplicationRecord
  belongs_to :advertis
  belongs_to :payment_methods

  has_many :p2p_orders
end
