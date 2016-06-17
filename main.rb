require 'sinatra'
require 'sinatra/contrib'
require "sinatra/reloader" if development?
require "sinatra/json"

set :logging, STDERR
set :bind, '0.0.0.0'
set :port, ENV['PORT']
set :json_content_type, :js

get '/' do
  json ["Hello World!"]
end

get 'igrejas' do
end

get 'cultos' do
end
