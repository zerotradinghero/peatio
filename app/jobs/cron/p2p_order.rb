module Jobs
  module Cron
    class P2pOrder
      def self.process
        ::P2pOrder.ordered.each do |ord|
          order_expired_time = ord.created_at + ord.advertisement.expired_time.minutes
          if Time.now > order_expired_time && ord.ordered?
            ord.update(status: :cancel)
          end
          if ord.ordered? && (cal_time_minute(order_expired_time) < 5) && (cal_time_minute(order_expired_time) > 0) && ord.is_sent_mess_remind_cancel == false
            message = "[Binance] P2P Order #{ord.order_number[8..12]} will expire in 5 mins. Pay and click 'Transferred, next' on the order detail page, fail to do so may result in financial loss."
            ord.send_message(message, ord.member)
            ord.update(is_sent_mess_remind_cancel: true)
            Rails.logger.info { "-------send mess remind #{ord.id}: #{Time.now}------------" }
          end
        end
        Rails.logger.info { "-------JOB update p2p order status: #{Time.now}------------" }
        sleep(5)
      end

      def self.cal_time_minute(time_to_now)
        (time_to_now.to_time - Time.now.to_time)/60
      end
    end
  end
end
