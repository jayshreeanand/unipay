class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :from_value, presence: true
  validates :to_value, presence: true
  validates :from_currency, presence: true
  validates :to_currency, presence: true

  before_save :make_payment

  def make_payment
    contact_user = User.where(payid: contact.payid).first

    send_value = from_value.to_f * to_value.to_f
    result = Payment::Client.new(user).send_money(send_value, contact_user)
  end
end
