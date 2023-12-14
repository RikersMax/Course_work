class CreatePurposes < ActiveRecord::Migration[7.1]
  def change
    create_table :purposes do |t|
      t.string :name_purpose

    end
  end
end
