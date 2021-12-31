# encoding: UTF-8
# frozen_string_literal: true

require 'csv'
class TradeMethod < ApplicationRecord

  def self.import
    count = 0
    CSV.foreach('spec/lib/trade_method/trade_methods.csv') do |csv|
      count += 1
      trade_method = self.where(identifier: csv[0], name: csv[1])
      unless trade_method
        self.new(identifier: csv[0], name: csv[1], type_code: csv[2]).save
      end
    end
    count
  end
end