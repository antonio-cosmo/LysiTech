json.extract! profile, :id, :fullname, :register, :department, :email, :profile_type_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
