
module Instapay
  class Client
    BASE_URI = "#{Rails.application.secrets.payid_api_base_url}"

    def initialize
    end

    private

    def client
      @_client ||= Faraday.new(BASE_URI) do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
        client.headers['Authorization'] = "Token #{auth_token}" if auth_token.present?
        client.headers['Content-Type'] = 'application/json'
        client.response :json, content_type: 'application/json'
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      begin
        response.body.deep_symbolize_keys
      rescue Error => e
      end
    end
  end
end