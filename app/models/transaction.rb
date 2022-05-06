class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :from_value, presence: true
  validates :to_value, presence: true
  validates :from_currency, presence: true
  validates :to_currency, presence: true

  after_save :make_payment
  # after_save :sync_to_xrp

  def make_payment
    contact_user = User.where(payid: contact.payid).first

    send_value = from_value.to_f * to_value.to_f
    self.delay.send_money_transaction(user, send_value, contact_user)
  end

 

  def send_money_transaction(user, send_value, contact_user)
    Payment::Client.new(user).delay.send_money(send_value, contact_user)
    Payment::Client.new(user).delay.send_money(send_value, contact_user)
  end
end
