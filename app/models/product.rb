class Product < ApplicationRecord
	belongs_to :brand, optional: true

	def clean
		return self.as_json(:except => [:created_at, :updated_at, :available_in_app])
	end
end
