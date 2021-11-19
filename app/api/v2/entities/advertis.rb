# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Entities
      class Advertis < Base
      	expose(
          :price,
          documentation: {
            type: BigDecimal,
            desc: "Price for each unit. e.g."\
                  "If you want to sell/buy 1 btc at 3000 usd, the price is '3000.0'" 
          }
        )
      end
    end
  end
end
