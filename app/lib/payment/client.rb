module Payment
  class Client
    BASE_URI = "test.xrp.xpring.io:50051"

    attr_accessor :client

    def initialize(user)
      @user = user
      @client = Xpring::Client.new(BASE_URI)
    end

    def balance(xrp_address)
      xrp_address='rLrF8T3rsuzD2MyMvrj1ogDnhkQPr1wVV6'
      balance = client.balance_of(xrp_address)
      balance/1_000_000
    end

    def transaction_status(transaction_id)
      client.status_of(transaction)
    end
  end
end