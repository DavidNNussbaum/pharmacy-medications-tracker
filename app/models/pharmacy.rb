class Pharmacy < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%").order('name')}

end
