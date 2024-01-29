json.extract! user, :id, :first_name, :last_name, :phone, :address_first, :address_second, :address_third, :postcode, :email, :password, :client_id, :created_at, :updated_at
json.url user_url(user, format: :json)
