json.extract! phone, :id, :phone_num, :profile_id, :created_at, :updated_at
json.url phone_url(phone, format: :json)
