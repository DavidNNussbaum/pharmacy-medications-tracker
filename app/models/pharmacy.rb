class Pharmacy < ApplicationRecord
    belongs_to :user
    has_many :prescriptions, :dependent => :destroy
    has_many :medications, through: :prescriptions
    validates :name, presence: true, uniqueness:true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%").order('name')}


    def self.order_by_name
        order('name')
    end

    def self.total_received
        Prescription.includes(:medication).group(:pharmacy_id, :name).count(:quantity_received)
    end
    
    def self.total_dispensed
        Prescription.includes(:medication).group(:pharmacy_id, :name).count(:quantity_dispensed)
    end

    def calc_amt_received
        amount_received = []
        amount_received << quantity_received
        amount_received
    end

    def self.current_total
        calc_amt_received - total_dispensed
    end
    
end
