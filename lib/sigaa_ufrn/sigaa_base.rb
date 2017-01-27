require 'typhoeus'
require 'json'

class SigaaBase
  SANDBOX_AUTH_URL = 'https://apitestes.info.ufrn.br'
  AUTH_URL = 'https://api.ufrn.br'

  attr_reader :auth_token, :token_type, :response, :body, :status

  def initialize(auth_token, token_type)
    @auth_token = auth_token
    @token_type = token_type
  end

  def run(http_method, endpoint_uri, params = {})
    @response = request(http_method, endpoint_uri, params).run
    @status = @response.code
    @body = JSON.parse(@response.body)
    self
  end

  private

  def service_url(endpoint_uri)
    "#{SANDBOX_AUTH_URL}/#{self.class::SERVICE_NAME}-services/services/#{endpoint_uri}"
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
