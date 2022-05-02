class Contact < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :payid, presence: true
  enum kind: { user: 0, business: 1, charity: 2}
end
