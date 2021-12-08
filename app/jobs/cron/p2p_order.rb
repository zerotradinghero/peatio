module Jobs
  module Cron
    class P2pOrder
      def self.process
        ::P2pOrder.ordered.each do |ord|
          order_expired_time = ord.created_at + ord.advertisement.expired_time.minutes
          if Time.now > order_expired_time
            ord.update(status: :cancel)
            account = ord.advertisement.creator.accounts.where(currency_id: ord.advertisement.currency_id).first
            account.unlock_funds(ord.number_of_coin)
          end
        end
        sleep(5)
      end
    end
  end
end
