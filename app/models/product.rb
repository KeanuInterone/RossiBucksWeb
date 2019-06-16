class Product < ApplicationRecord
	belongs_to :brand, optional: true
end
