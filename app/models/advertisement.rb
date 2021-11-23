# frozen_string_literal: true

class Advertisement < ApplicationRecord
  has_many :advertisement_payment_methods
  has_many :payment_methods, through: :advertisement_payment_methods
  has_many :p2p_orders, through: :advertisement_payment_methods
  belongs_to :currency, required: true
  belongs_to :creator, class_name: Member.name, foreign_key: :creator_id

  enum advertis_type: [:sell, :buy]
end
