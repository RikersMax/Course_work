class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.string :name_movement

      t.timestamps
    end
  end

  Movement.create([
    {
      name_movement: 'Приход'
    },
    {
      name_movement: 'Расход'
    }
  ])
end
