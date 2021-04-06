class Medication < ApplicationRecord
    has_many :pharmacies
    has_many :patients, through: :pharmacies

    accepts_nested_attributes_for :patients, reject_if: proc{|attr| attr[:name].blank?}
    validates :name, presence: true
    validates :quantity, presence: true
end
