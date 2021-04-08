class Prescription < ApplicationRecord
  belongs_to :medication
  belongs_to :patient
  belongs_to :pharmacy

  accepts_nested_attributes_for :medication
  accepts_nested_attributes_for :manager

end