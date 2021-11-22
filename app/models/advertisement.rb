# frozen_string_literal: true

class Advertisement < ApplicationRecord
  has_many :advertisement_payment_methods
  has_many :payment_methods, through: :advertisement_payment_methods
  has_many :p2p_orders, through: :advertisement_payment_methods
end
