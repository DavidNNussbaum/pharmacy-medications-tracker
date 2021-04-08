class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :medication, null: false, foreign_key: true
      t.references :pharmacy, null: false, foreign_key: true
      t.boolean :dispensed, default: false

      t.timestamps
    end
  end
end
