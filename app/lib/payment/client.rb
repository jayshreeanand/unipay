module Payment
  class Client
    BASE_URI = "test.xrp.xpring.io:50051"

    attr_accessor :client
    attr_accessor :user

    test_wallets = [
      { secret: 'sn8gDcc93h6nwgy72io26ePigosQb', address: 'rGhoYjkvuSMmVvBfZ4LEkf633dJfWVxJkx'}
    ]
    
    def initialize(user)
      @user = user
      @client = Xpring::Client.new(BASE_URI)
    end

    def balance
      xrp_address = user.xrp_address
      balance = client.balance_of(xrp_address)
      if balance.nil?
        balance = 1000000000
      end
      balance/1_000_000
    end

    def transaction_status(transaction_id)
      client.status_of(transaction)
    end
  end
end

# rGhoYjkvuSMmVvBfZ4LEkf633dJfWVxJkx



sample_test_wallets = ['rULaXLNRSLDjDAWon1nECBYEmq9TReAZdA', 'rhxvJpW99nYbKnPJgmDr16XEELNbCJqfVG', 'r3FEaVBZyAjwjPt4W3VJKCVneK5W23Aw7i', 'rPmZ1xmCSGG5zkWkNwTRL4eodnrzF99STd']