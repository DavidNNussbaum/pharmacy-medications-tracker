class Prescription < ApplicationRecord
  belongs_to :medication
  belongs_to :patient
  belongs_to :pharmacy
 
  accepts_nested_attributes_for :medication, reject_if: proc{|attr| attr[:name].blank?}
  accepts_nested_attributes_for :patient, reject_if: proc{|attr| attr[:dob].blank?}
  accepts_nested_attributes_for :pharmacy, reject_if: proc{|attr| attr[:name].blank?}

  
end