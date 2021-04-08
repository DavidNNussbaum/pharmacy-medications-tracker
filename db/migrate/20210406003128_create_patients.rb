class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.datetime :dob, null: false

      t.timestamps
    end
  end
end
