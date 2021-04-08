class Medication < ApplicationRecord
    has_many :prescriptions
    has_many :patients, through: :prescriptions

    accepts_nested_attributes_for :patients, reject_if: proc{|attr| attr[:name].blank?}
    validates :name, presence: true
    validates :quantity, presence: true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%").order('name')}
end
