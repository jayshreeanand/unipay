
module Rapyd
  class Client
    BASE_URI = "https://sandboxapi.rapyd.net/"

    def initialize
      @options = { access_key: Rails.application.secrets.rapyd_access_key, secret_key: Rails.application.secrets.rapyd_secret_key }
    end

    def create_checkout_page(amount, currency)
      body = {
        "amount": amount,
        "complete_payment_url": "http://example.com/complete",
        "country": "us",
        "currency": "USD",
        "error_payment_url": "http://example.com/error",
        "merchant_reference_id": "0912-2021",
        "language": "en",
        "metadata": {
            "merchant_defined": true
        },
        "payment_method_types_include": [
           "us_mastercard_card", "us_visa_card", "us_ach_bank"
        ]
    }
      response = request(http_method: :post, endpoint: 'v1/checkout', params: body.to_json, rel_path: "post/v1/checkout" )
      response["data"]["id"]
    end

    def generate_hmac(rel_path, salt, timestamp, payload)
      signature = "#{rel_path}#{salt}#{timestamp}#{@options[:access_key]}#{@options[:secret_key]}#{payload}"
      hash = Base64.urlsafe_encode64(OpenSSL::HMAC.hexdigest('sha256', @options[:secret_key], signature))
      hash
    end

    private

    def client
      @_client ||= Faraday.new(BASE_URI) do |client|
        client.adapter Faraday.default_adapter
        client.headers['Content-Type'] = 'application/json'
        client.headers['access_key'] = Rails.application.secrets.rapyd_access_key
        client.response :json, content_type: 'application/json'
      end
    end
    

    def request(http_method:, endpoint:, params: {}, rel_path: '')
      timestamp = Time.new.to_i.to_s
      salt = SecureRandom.base64(12)
      client.headers['salt'] = salt
      client.headers['timestamp'] = timestamp
      client.headers['signature'] = generate_hmac(rel_path, salt, timestamp, params)
     
      response = client.public_send(http_method, endpoint, params)
     
      begin
        response.body
      rescue IOError => e
        p e
      end
    end
  end
end