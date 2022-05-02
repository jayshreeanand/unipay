class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts, dependent: :destroy

  def payid_full
    "#{payid}$insta-pay.me"
  end

  def qr_code_svg
    qrcode = RQRCode::QRCode.new("https://www.insta-pay.me/search?payid=#{payid}")
  end
end
