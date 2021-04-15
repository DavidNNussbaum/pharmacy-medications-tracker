class Prescription < ApplicationRecord
  belongs_to :medication
  belongs_to :patient
  belongs_to :pharmacy
 
  accepts_nested_attributes_for :medication, reject_if: proc{|attr| attr[:name].blank?}
  accepts_nested_attributes_for :patient, reject_if: proc{|attr| attr[:dob].blank?}
  accepts_nested_attributes_for :pharmacy, reject_if: proc{|attr| attr[:name].blank?}

  def total_received
    Prescription.includes(:medication).group(:pharmacy_id, :name).count(:quantity_received)
  end

  def total_dispensed
    Prescription.includes(:medication).group(:pharmacy_id, :name).count(:quantity_dispensed)
  end

 

  def organize
    self.order('name')
  end

end