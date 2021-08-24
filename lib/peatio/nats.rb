require 'nats/io/client'

module Peatio
  module NATS
    class <<self
      def connection
        @connection ||= ::NATS::IO::Client.new.connect(ENV["NATS_URL"])
      end

      def publish(subj, attrs={})
        connection.publish(subj, attrs)
      end
    end
  end
end
