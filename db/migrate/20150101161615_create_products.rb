class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal  :price
      t.integer :quantity
      t.string :sku

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
