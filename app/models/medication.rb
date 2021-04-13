class Medication < ApplicationRecord
    has_many :prescriptions
    has_many :patients, through: :prescriptions
    has_many :pharmacies, through: :prescriptions
    

    accepts_nested_attributes_for :patients, reject_if: proc{|attr| attr[:last_name].blank?}
    accepts_nested_attributes_for :pharmacies, reject_if: proc{|attr| attr[:name].blank?}
    validates :name, presence: true
    validates :quantity_dispensed, presence: true
    validates :quantity_received, presence: true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%").order('name')}

    def order_by_name
        order('name')
    end

end
