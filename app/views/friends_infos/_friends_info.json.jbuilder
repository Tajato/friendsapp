json.extract! friends_info, :id, :first_name, :last_name, :instagram, :phone_number, :created_at, :updated_at
json.url friends_info_url(friends_info, format: :json)
