json.extract! order, :id, :name, :address, :text, :email, :paytype, :created_at, :updated_at
json.url order_url(order, format: :json)
