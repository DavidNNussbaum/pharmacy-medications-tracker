class Medication < ApplicationRecord
    has_many :pharmacies
    has_many :patients, through: :pharmacies
end
