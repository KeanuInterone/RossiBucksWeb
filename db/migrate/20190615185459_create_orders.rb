class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.belongs_to :user, null: false
    	t.belongs_to :shop, null: false

      	t.timestamps
    end
    add_index :orders, [:user_id, :shop_id]
  end
end