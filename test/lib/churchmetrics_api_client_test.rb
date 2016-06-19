require "test_helper"
class ChurchMetricsApiClientTest < Minitest::Test
  def setup
    @client = ChurchMetricsApiClient.new
  end

  def test_get_churchs
    churchs = @client.churchs
    assert_instance_of Array, churchs
    assert_equal "Igreja Batista Lírio dos Vales", churchs[0]["slug"]
  end

  def test_get_services
    services = @client.services
    assert_instance_of Array, services
    assert_equal 0, services[0]["day_of_week"]
    assert_equal "Igreja Batista Lírio dos Vales", services[0]["campus"]["slug"]
    assert_equal "CULTO DA FAMÍLIA", services[0]["event"]["name"]
  end
end
