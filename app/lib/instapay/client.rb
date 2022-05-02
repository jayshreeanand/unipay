
module Instapay
  class Client
    BASE_URI = "#{Rails.application.secrets.payid_api_base_url}"
    PAYID_SERVER = "insta-pay.me"

    def initialize
    end

    def create_payid(username, type: 'xrp')
      
      body = {
          "payId": "#{username}$#{PAYID_SERVER}",
          "addresses": [
            {
              "paymentNetwork": "XRPL",
              "environment": "TESTNET",
              "details": {
                  "address": "rDk7FQvkQxQQNGTtfM2Fr66s7Nm3k87vdS"
              }
            }
          ]
      }
      response = request(http_method: :post, port: 8081, endpoint: 'users', params: body.to_json )
    end

    def request_payid(username, type: 'xrp')
      response = request(http_method: :get,  port: 8080, endpoint: username)
      JSON.parse(response)
    end

    private

    def client
      @_client ||= Faraday.new(BASE_URI) do |client|
        client.adapter Faraday.default_adapter
        client.headers['Content-Type'] = 'application/json'
        client.headers["PayID-API-Version"] = "2020-05-28"
        client.headers["PayID-Version"] = "1.0"
        client.headers["Accept"] = "application/xrpl-testnet+json"
        client.response :json, content_type: 'application/json'
      end
    end
    

    def request(http_method:, endpoint:, port:,  params: {})
      client.port = port
      response = client.public_send(http_method, endpoint, params)
      begin
        response.body
      rescue IOError => e
        p e
      end
    end
  end
end