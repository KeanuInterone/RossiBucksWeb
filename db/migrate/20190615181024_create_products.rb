class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :ean
      t.integer :points
      t.boolean :available_in_app

      t.timestamps
    end
  end
end
