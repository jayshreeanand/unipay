class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :from_value, presence: true
  validates :to_value, presence: true
  validates :from_currency, presence: true
  validates :to_currency, presence: true
end
