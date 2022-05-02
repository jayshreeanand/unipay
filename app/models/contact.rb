class Contact < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :payid, presence: true
  enum kind: { user: 0, business: 1, charity: 2}
  # before_save :add_gravatar
  before_validation :add_name



  def payid_full
    "#{payid}$insta-pay.me"
  end

  def avatar_url
    avatar || 'avatar.png'
  end

  def add_gravatar
    if !avatar.present?
      email = self.email.downcase
      email_hash = Digest::MD5.hexdigest(email)
      self.avatar = "https://www.gravatar.com/avatar/#{email_hash}/?d=identicon"
    end
  end

  def add_name
    if !name.present?
      self.name = payid.capitalize
    end
  end

  def exchange_rate
    result = Cryptocompare::Price.find('USD', ['XRP','BTC', 'ETH'])
    result['USD']
  end
end
