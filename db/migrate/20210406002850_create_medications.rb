class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.string :name, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
