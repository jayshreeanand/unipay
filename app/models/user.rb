class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :sent_requests, class_name: "Request", foreign_key: 'sender_id'
  has_many :received_requests, class_name: "Request", foreign_key: 'recipient_id'

  
  before_save :add_gravatar

  def payid_full
    "#{payid}@unipay"
  end

  def qr_code_svg
    qrcode = RQRCode::QRCode.new("https://#{Rails.application.secrets.remote_host}/search?payid=#{payid}")

    qrcode = RQRCode::QRCode.new("https://www.insta-pay.me/search?payid=#{payid}")
  end

  def add_gravatar
    if !avatar.present?
      email = self.email.downcase
      email_hash = Digest::MD5.hexdigest(email)
      self.avatar = "https://www.gravatar.com/avatar/#{email_hash}/?d=identicon"
    end
  end

  def avatar_url
    avatar || 'avatar.png'
  end
end
