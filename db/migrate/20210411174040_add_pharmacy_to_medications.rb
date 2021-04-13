class AddPharmacyToMedications < ActiveRecord::Migration[6.0]

  def change
    add_reference :medications, :pharmacy
  end
end
