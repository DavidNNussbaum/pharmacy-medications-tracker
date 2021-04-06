class Pharmacy < ApplicationRecord
    belongs_to :medication
    belongs_to :patient
    has_one :manager
    accepts_nested_attributes_for :ingredients
    accepts_nested_attributes_for :managers

    validates :name, presence: true
end
