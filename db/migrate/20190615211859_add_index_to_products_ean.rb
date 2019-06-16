class AddIndexToProductsEan < ActiveRecord::Migration[5.2]
  def change
  	add_index :products, [:ean], unique: true
  end
end
