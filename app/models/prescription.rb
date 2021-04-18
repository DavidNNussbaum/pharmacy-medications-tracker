class Prescription < ApplicationRecord
  belongs_to :medication
  belongs_to :patient
  belongs_to :pharmacy

  validates :quantity_dispensed, presence: true
 
  accepts_nested_attributes_for :medication, reject_if: proc{|attr| attr[:name].blank?}
  accepts_nested_attributes_for :patient, reject_if: proc{|attr| attr[:dob].blank?}
  accepts_nested_attributes_for :pharmacy, reject_if: proc{|attr| attr[:name].blank?}

 
  def self.pharmacy_name
    Presription.find_by(@patient_id).pharmacy.name
  end

  def organize
    self.order('name')
  end

end