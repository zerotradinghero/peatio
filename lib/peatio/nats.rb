require 'nats/io/client'

module Peatio
  module NATS
    class <<self
      def connection
        if @connection
          @connection
        else
          @connection = ::NATS::IO::Client.new
          @connection.connect(ENV["NATS_URL"])
          @connection
        end
      end

      def publish(subj, attrs={})
        connection.publish(subj, attrs.to_json)
      end
    end
  end
end
