# frozen_string_literal: true

class PaymentMethod < ApplicationRecord
  belongs_to :member

  has_many :advertis_payment_methods
  has_many :advertises, through: :advertis_payment_methods
  has_many :p2p_orders, through: :advertis_payment_methods
end
