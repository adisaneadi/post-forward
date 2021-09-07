require 'sinatra'
require 'rest-client'
require 'json'
require 'dotenv'
Dotenv.load

get '/' do
  'Hello world'
end

post '/:uuid' do |uuid|
  url = "#{ENV['webhook_base_url']}"
  data = request.body.read.to_s
  puts data
  RestClient.post url, JSON.parse(data), headers
  'webhook routed!'
end
