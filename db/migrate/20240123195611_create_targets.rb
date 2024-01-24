class CreateTargets < ActiveRecord::Migration[7.1]
  def change
    create_table :targets do |t|
      t.string :name

      t.timestamps
    end
  end
end
