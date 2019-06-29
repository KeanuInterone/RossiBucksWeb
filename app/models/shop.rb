class Shop < ApplicationRecord
	has_and_belongs_to_many :employees, class_name: :User, join_table: "shop_employees"
	has_and_belongs_to_many :reps, class_name: :User, join_table: "shop_reps"
	has_many :orders
	has_many :sold_products, through: :orders, source: :products

	def get_points
		points = 0	
		self.sold_products.each do |product| 
			points += product.points
		end 
		return points
	end

	def get_top_product

		productCountMap = Hash.new
		self.sold_products.each do |product|

			productCount = productCountMap[product.id]
			if (productCount) 
				productCountMap[product.id] = productCount + 1
			else 
				productCountMap[product.id] = 1

			end

		end

		maxCount = 0
		maxProductID = nil
		productCountMap.each do |key, value|

			if value > maxCount 
				maxCount = value
				maxProductID = key
			end

		end

		if maxProductID.nil? 
			return nil
		else 
			return {"product" => Product.find(maxProductID), "count" => maxCount}
		end

	end

end
