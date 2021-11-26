# frozen_string_literal: true

class PaymentMethod < ApplicationRecord
  belongs_to :member

  has_many :advertisesment_payment_methods
  has_many :advertisesments, through: :advertisesment_payment_methods
  has_many :p2p_orders, through: :advertisesment_payment_methods

  enum payment_type: ['', :bank_transfer]
end
