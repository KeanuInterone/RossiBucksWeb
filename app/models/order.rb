class Order < ApplicationRecord
	belongs_to :user
	belongs_to :shop
	has_and_belongs_to_many :products, class_name: :Product, join_table: "order_products"



	def jsonWithProducts
		orderJson = self.as_json
		orderJson["products"] = self.products.map { |p| p.clean }
		return orderJson
	end
end
