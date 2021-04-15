class Patient < ApplicationRecord
    has_many :prescriptions
    has_many :pharmacies, through: :prescriptions
    has_many :medications, through: :prescriptions
    

    validates :first_name, :last_name, presence: true
    validates :dob, :address, presence: true
    scope :search_by_name, -> (search) {where("last_name LIKE ?", "#{search}%").order('last_name')}

    def name
        "#{first_name} #{last_name}"
    end
end
