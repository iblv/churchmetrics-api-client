require 'json'
require "requests/sugar"

class ChurchMetricsApiClient
  def churchs
    get_resource("campuses.json")
  end

  def services
    get_resource("service_times.json")
  end

  def set_headers
    {"X-Auth-User": ENV['CHURCH_METRICS_USER'], "X-Auth-Key": ENV['CHURCH_METRICS_KEY']}
  end

  def endpoint
    "https://churchmetrics.com/api/v1/"
  end

  def get_resource(path)
    response = Requests.get("#{endpoint}#{path}", headers: set_headers)
    JSON.parse(response.body)
  end
end
