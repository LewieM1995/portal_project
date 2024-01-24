json.extract! client_detail, :id, :client_id, :client_name, :email, :number, :client_address, :client_postcode, :created_at, :updated_at
json.url client_detail_url(client_detail, format: :json)
