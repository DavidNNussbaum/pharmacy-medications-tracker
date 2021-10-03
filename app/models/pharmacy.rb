class Pharmacy < ApplicationRecord
    belongs_to :user
    has_many :prescriptions, :dependent => :destroy
    has_many :medications
    # has_many :medications, through: :prescriptions
    validates :name, presence: true, uniqueness:true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%").order('name')}


    def self.order_by_name
        order('name')
    end

    
end
