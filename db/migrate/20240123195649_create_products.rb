class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :ident_number, null: false, index: {unique: true}
      t.belongs_to :target, null: false, foreign_key: true

      t.text :description

      t.timestamps
    end
  end
end
