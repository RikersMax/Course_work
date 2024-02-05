class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity
      t.belongs_to :movement, null: false, foreign_key: true
      t.belongs_to :employee, null:false, foreign_key: true
      t.string :address
      t.string :description
      t.datetime :datestamp

      t.timestamps
    end
  end
end
