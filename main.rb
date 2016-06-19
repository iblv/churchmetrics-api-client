require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/json"
require "./lib/churchmetrics_api_client"

set :logging, STDERR
set :bind, '0.0.0.0'
set :port, ENV['PORT']
set :json_content_type, :js
set :allow_origin, "*"

module ChurchMetricsApiClientHelpers
  def production?
    ENV['RACK_ENV'] == 'production'
  end
end

helpers ChurchMetricsApiClientHelpers

before do
  headers 'Access-Control-Allow-Origin' => '*'
  headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
  cache_control :public, :must_revalidate, :max_age => 36000 if production?
  @client = ChurchMetricsApiClient.new
end

get '/churchs' do
  json @client.churchs
end

get '/services' do
  json @client.services
end

not_found do
  'Page not found.'
end
