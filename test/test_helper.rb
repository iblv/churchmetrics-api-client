ENV['RACK_ENV'] = 'test'
require "minitest/autorun"
require 'minitest/rg'
require "./lib/churchmetrics_api_client"
require './main'
require 'rack/test'
