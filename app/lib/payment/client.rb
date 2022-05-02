module Payment
  class Client
    BASE_URI = "test.xrp.xpring.io:50051"

    attr_accessor :client
    attr_accessor :user

  
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

    def send_money(amount, contact_user)
      wallet = Xpring::Wallet.from_seed(user.xrp_secret)
      amount = amount.to_i * 1000000
      result = client.send_xrp(amount: amount, to: 'X7Y1ugDoD2qwFGhCYzk4nRGYuuwcaBxbhiCrNxzsw89Jgua', from: wallet)
    end

    def transaction_status(transaction_id)
      client.status_of(transaction)
    end

    def test_wallets
      test_wallets = [
        { secret: 'sn8gDcc93h6nwgy72io26ePigosQb', address: 'rGhoYjkvuSMmVvBfZ4LEkf633dJfWVxJkx'},
        { secret: 'shveCYhNusbJcLq5VSEkpVujXi2Zy', address: 'rfrURSS58bCXNa3MFkMLuFzcE3dCKqefmg'},
        { secret: 'sn7zVe3rSmQAs8AmhxxJSAp6tJ7vC', address: 'rJELpsNbVk2u1T5XmH56ZTQqNMCvQT3gYR'},
        { secret: 'snuDQxY99icXDCk3vYMRkaQrkPhL5', address: 'rpnan7esK6qnbTiwyz9A4DZBw5J1Afuppv'},
        { secret: 'spAmpmwTkXA3s15CX6QmKZ2iA7Hsr', address: 'rNqHZFL7cjkGGXabJGqCPD6QEyGQNc5E8y'},
      ]
      test_wallets_new = [
        { secret: 'ssvkzfbdUmmtEpGLvFginoAmVKQ2W', classic_address: 'rpdicQ6YQYZpNgTxUB9QEM4Me2MAmy38gV', address: 'X7Y1ugDoD2qwFGhCYzk4nRGYuuwcaBxbhiCrNxzsw89Jgua'}
      ]
    end
  end
end

# rGhoYjkvuSMmVvBfZ4LEkf633dJfWVxJkx



