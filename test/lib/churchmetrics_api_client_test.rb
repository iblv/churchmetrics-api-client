require "test_helper"
class ChurchMetricsApiClientTest < Minitest::Test
  def setup
    @client = ChurchMetricsApiClient.new
  end

  def test_get_churchs
    churchs = @client.churchs
    assert churchs.class == Array
  end

  def test_get_service_times
    services = @client.service_times
    assert churchs.class == Array
  end
end
