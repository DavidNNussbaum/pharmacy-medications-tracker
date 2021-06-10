class Medication < ApplicationRecord
    belongs_to :pharmacy
    has_many :prescriptions,:dependent => :destroy
    has_many :patients, through: :prescriptions, :dependent => :destroy
    has_many :pharmacies, through: :prescriptions, :dependent => :destroy
    

    accepts_nested_attributes_for :patients, reject_if: proc{|attr| attr[:last_name].blank?}
    accepts_nested_attributes_for :pharmacies, reject_if: proc{|attr| attr[:name].blank?}
    validates :name, presence: true, uniqueness: {scope: :pharmacy_id}
    validates :quantity_received, presence: true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%").order('name')}

    def self.order_by_name
        order('name')
    end

    def current_total
        total_quantity_dispensed = prescriptions.where(pharmacy: pharmacy).pluck(:quantity_dispensed).compact.sum
        quantity_received - total_quantity_dispensed   
    end

end
