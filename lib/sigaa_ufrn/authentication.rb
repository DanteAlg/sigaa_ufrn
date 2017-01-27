module SigaaUfrn
  class Authentication
    AUTH_URL = 'http://apitestes.info.ufrn.br/authz-server/oauth/token'

    class << self
      # Authenticação para acessar dados públicos dos sistemas da SINFO
      # Acessa eventos, notícias, telefones
      def client_credentials(client_id, client_secret)
        new.request('client_credentials', client_id: client_id, client_secret: client_secret)
      end

      # Authenticação para acessar dados privados dos sistemas da SINFO, deve ser usado no endpoint após o Oauth no site da api
      # Acessa turmas de um usuário, frequências de um discente, histórico de utilização de um usuário no restaurante universitário
      def authorization_code(client_id, client_secret, redirect_uri, code)
        new.request('authorization_code', client_id: client_id, client_secret: client_secret, redirect_uri: redirect_uri, code: code)
      end

      # Atualização do token de acesso privado do authorization_code
      def refresh_token(client_id, client_secret, refresh_token)
        new.request('refresh_token', client_id: client_id, client_secret: client_secret, refresh_token: refresh_token)
      end
    end

    # response = { “access_token”: “111”, “token_type”: “bearer”, "refresh_token": "abcd" , “expires_in”: 7431095, “scope”: “read” }
    # Enviar no header das requests: Authorization "response['token_type'] response['access_token']"

    def request(grant_type, params)
      auth_request('refresh_token', params)
    end

    private

    def auth_request(grant_type, params = {})
      Typhoeus::Request.new(AUTH_URL, method: :post, params: params)
    end
  end
end
