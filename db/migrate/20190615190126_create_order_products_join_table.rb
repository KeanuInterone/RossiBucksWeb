class CreateOrderProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :order_products, id: false do |t|
    	t.belongs_to :order, null: false
    	t.belongs_to :product, null: false
    end
    add_index :order_products, [:order_id, :product_id]
  end
end
