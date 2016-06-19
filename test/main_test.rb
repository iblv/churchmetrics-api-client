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
  end

  def test_it_get_services
    get '/services'
    assert last_response.ok?
    assert last_response.body.include?("\"day_of_week\":0,\"time_of_day\":\"2000-01-01T10:00:00")
  end
end
