class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :ident_number
      t.belongs_to :target, null: false, foreign_key: true

      t.text :description

      t.timestamps
    end
  end
end
