json.extract! contact, :id, :user_id, :name, :description, :payid, :type, :avatar, :created_at, :updated_at
json.url contact_url(contact, format: :json)
