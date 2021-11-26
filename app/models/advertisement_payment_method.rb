# frozen_string_literal: true

class AdvertisementPaymentMethod < ApplicationRecord
  belongs_to :advertisement
  belongs_to :payment_method

  has_many :p2p_orders
end
