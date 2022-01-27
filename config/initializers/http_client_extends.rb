require 'json'
require 'faraday'
require 'faraday_middleware'

def http_client
  Faraday.new(url: @root_api_url) do |conn|
    conn.request :json
    conn.response :json
    conn.adapter Faraday.default_adapter
  end
end

# Example
# uri = URI('http://barong:8001/api/v2/management/phones/send')
# Net::HTTP.start(uri.host, uri.port, :use_ssl => false) do |http|
#   request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
#   request.body = generate_jwt_management({ :uid => 'UID123', :content => 'Hello World'})
#   response = http.request request # Net::HTTPResponse object
#   puts "response #{response.body}"
# end

