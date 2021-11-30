require 'json'
require 'faraday'
require 'faraday_middleware'

# Create HTTP request with ruby Faraday client library
module Faraday
  class Connection
    alias original_run_request run_request
    def run_request(method, url, body, headers, &block)
      original_run_request(method, url, body, headers, &block).tap do |response|
        response.env.instance_variable_set :@request_body, body if body
      end
    end
  end
end

def http_client
  Faraday.new(url: @root_api_url) do |conn|
    conn.request :json
    conn.response :json
    conn.adapter Faraday.default_adapter
  end
end

# Example
# http_client
#   .public_send(:post,'http://barong:8001/api/v2/management/phones/send', generate_jwt_management({ :uid => 'UID123', :content => 'Hello World'}))
#   .body
