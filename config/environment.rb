# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

require 'net/http'
require "uri"

uri = URI.parse("http://google.com/")
http = Net::HTTP.new(uri.host, uri.port)
response = http.request(Net::HTTP::Get.new(uri.request_uri))
Net::HTTP.get_print(uri)