class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :job_title
      t.string :personnel_number

    end
  end
end
