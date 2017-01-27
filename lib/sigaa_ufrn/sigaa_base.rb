require 'typhoeus'

class SigaaBase
  SANDBOX_AUTH_URL = 'http://apitestes.info.ufrn.br'
  AUTH_URL = 'http://api.ufrn.br'

  attr_reader :auth_token, :token_type

  def initialize(auth_token, token_type)
    @auth_token = auth_token
    @token_type = token_type
  end

  def run(http_method, endpoint_uri, params = {})
    request(http_method, endpoint_uri, params)
  end

  private

  def service_url(endpoint_uri)
    "#{AUTH_URL}/#{service_type}/services/#{endpoint_uri}"
  end

  def service_type
    'example-service'
  end

  def query_to_url(query)
    query_labels = query.keys.join('/')
    query_values = query.values.join('/')
    "#{query_labels}/#{query_values}"
  end

  def request(http_method, endpoint_uri, params = {})
    Typhoeus::Request.new(
      service_url(endpoint_uri),
      method: http_method,
      params: params,
      headers: {
        Authorization: "#{token_type} #{auth_token}",
        Accept: 'application/json'
      }
    )
  end
end
