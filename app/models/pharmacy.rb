class Pharmacy < ApplicationRecord
    belongs_to :medication
    belongs_to :patient
    has_one :manager
end
