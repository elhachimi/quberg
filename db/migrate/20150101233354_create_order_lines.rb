class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
