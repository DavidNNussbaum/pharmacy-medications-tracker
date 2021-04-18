class MoveQuantityDispensedFromMedicationsToPrescriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :medications, :quantity_dispensed
    add_column :prescriptions, :quantity_dispensed, :integer, null: false, default: 0
  end
end
