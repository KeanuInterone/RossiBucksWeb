class Shop < ApplicationRecord
	has_and_belongs_to_many :employees, class_name: :User, join_table: "shop_employees"
	has_and_belongs_to_many :reps, class_name: :User, join_table: "shop_reps"
	has_many :orders
end
