module Jobs
  module Cron
    class P2pOrder
      def self.process
        ::P2pOrder.ordered.each do |ord|
          order_expired_time = ord.created_at + ord.advertisement.expired_time.minutes
          if Time.now > order_expired_time
            ord.update(status: :cancel)
            ord.send_message_status
          end
        end
        Rails.logger.info { "-------JOB update p2p order status: #{Time.now}------------" }
        sleep(5)
      end
    end
  end
end
