json.extract! company, :id, :user_id, :business_name, :email, :phone, :owner_name, :created_at, :updated_at
json.url company_url(company, format: :json)
