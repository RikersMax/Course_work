class CreateEmployeers < ActiveRecord::Migration[7.1]
  def change
    create_table :employeers do |t|
      t.string :name
      t.string :number
      t.string :job_title

      t.timestamps
    end
  end
end
