class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.string :name_movement

    end
  end
end
