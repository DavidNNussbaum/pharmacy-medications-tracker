class Manager < ApplicationRecord
    belongs_to :pharmacy 

    validates :username, presence: true
    validates :password, presence: true
    validates :code, presence: true
end
