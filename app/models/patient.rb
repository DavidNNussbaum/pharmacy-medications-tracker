class Patient < ApplicationRecord
    has_many :prescriptions
    has_many :medications, through: :prescriptions

    validates :name, presence: true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%").order('last_name')}
end
