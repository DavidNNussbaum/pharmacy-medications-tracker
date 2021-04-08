class CreatePharmacies < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :address
      t.references :user
    
      t.timestamps
    end
  end
end
