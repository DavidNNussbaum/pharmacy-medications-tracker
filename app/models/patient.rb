class Patient < ApplicationRecord
    has_many :pharmacies
    has_many :medications, through: :pharmacies

    validates :name, presence: true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%")}
end
