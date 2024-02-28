class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :number, null: false, index: { unique: true }
      t.string :job_title

      t.timestamps
    end
  end
end
