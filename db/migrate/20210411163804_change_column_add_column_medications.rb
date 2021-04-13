class ChangeColumnAddColumnMedications < ActiveRecord::Migration[6.0]
  def change
    rename_column :medications, :quantity, :quantity_dispensed
    add_column :medications, :quantity_received, :integer, null: false, default: 0
    change_column_default :medications, :quantity_dispensed, 0
  end
end
