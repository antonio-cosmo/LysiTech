json.extract! user, :id, :username, :userpassword, :profile_id, :created_at, :updated_at
json.url user_url(user, format: :json)
