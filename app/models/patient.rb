class Patient < ApplicationRecord
    has_many :pharmacies
    has_many :medications, through: :pharmacies

    validates :name, presence: true
end
