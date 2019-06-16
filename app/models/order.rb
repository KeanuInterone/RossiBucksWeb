class Order < ApplicationRecord
	belongs_to :user
	belongs_to :shop
	has_and_belongs_to_many :products, class_name: :Product, join_table: "order_products"


end
