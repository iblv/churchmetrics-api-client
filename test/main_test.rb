require 'test_helper'

class MainTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_get_churchs
    get '/churchs'
    assert last_response.ok?
    assert last_response.body.include?("\"slug\":\"Igreja Batista")
    assert_equal "*", last_response.headers['Access-Control-Allow-Origin']
  end

  def test_it_get_services
    get '/services'
    assert last_response.ok?
    assert last_response.body.include?("\"day_of_week\":0,\"time_of_day\":\"2000-01-01T10:00:00")
    assert_equal "*", last_response.headers['Access-Control-Allow-Origin']
  end

  def test_not_found
    get '/'
    assert last_response.not_found?
    assert_equal 'Page not found.', last_response.body
  end
end
