json.extract! transaction, :id, :user, :contact, :from_value, :from_currency, :to_value, :to_currency, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
