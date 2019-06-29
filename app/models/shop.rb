class Shop < ApplicationRecord
	has_and_belongs_to_many :employees, class_name: :User, join_table: "shop_employees"
	has_and_belongs_to_many :reps, class_name: :User, join_table: "shop_reps"
	has_many :orders

	def get_points 
		points = 0
		self.orders.each do |order|
			order.products.each do |product|
				points += product.points
			end
		end
		return points
	end


end
