class CreateShopEmployeesJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :shop_employees, id: false do |t|
    	t.belongs_to :user, null: false
    	t.belongs_to :shop, null: false
    end
    add_index :shop_employees, [:user_id, :shop_id], unique: true
  end
end
