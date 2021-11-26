# frozen_string_literal: true

class P2pOrder < ApplicationRecord
  belongs_to :advertisement_payment_methods


  def self.create_order(params)

  end
end
