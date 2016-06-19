require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/json"
require "./lib/churchmetrics_api_client"

set :logging, STDERR
set :bind, '0.0.0.0'
set :port, ENV['PORT']
set :json_content_type, :js

before do
  @client = ChurchMetricsApiClient.new
end

get '/churchs' do
  json @client.churchs
end

get '/services' do
  json @client.services
end
