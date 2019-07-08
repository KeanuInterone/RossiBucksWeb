class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	#has_secure_password
	enum role: { shop_employee: 0, rep: 1, admin: 2 }
	has_and_belongs_to_many :works_at, class_name: :Shop, join_table: "shop_employees"
	has_and_belongs_to_many :reps_for, class_name: :Shop, join_table: "shop_reps"
	has_many :orders


end
