class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :account_number
      t.string :location

      t.timestamps
    end
    add_index :shops, :account_number, unique: true
    change_column_null :shops, :account_number, false
  end
end
