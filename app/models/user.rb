class User < ApplicationRecord
    has_many :pharmacies
    has_secure_password
    validates :email, presence: true
    validates :password, presence: true
     
    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
            u.username = auth['info']['name'].downcase.gsub(" ", "_")
          end
    end
end
