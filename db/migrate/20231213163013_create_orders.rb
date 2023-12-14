class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :movement_id
      t.integer :quantity
      t.datetime :date
      t.string :address
      t.integer :person_id
      t.text :note


    end
  end
end
