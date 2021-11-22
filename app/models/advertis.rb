# frozen_string_literal: true

class Advertis < ApplicationRecord
  has_many :advertis_payment_methods
  has_many :payment_methods, through: :advertis_payment_methods
  has_many :p2p_orders, through: :advertis_payment_methods
end
