json.extract! product, :id, :ean, :points, :available_in_app, :created_at, :updated_at
json.url product_url(product, format: :json)
