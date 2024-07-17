class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :fio, null: false
      t.string :login, null: false
      t.string :password
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
