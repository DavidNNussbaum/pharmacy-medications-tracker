class User < ApplicationRecord
    has_many :pharmacies
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
     
    def self.from_omniauth(auth)
        user = find_by(email: auth['info']['email'])
        unless user
            user = self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
                u.email = auth['info']['email']
                p = SecureRandom.hex(20)
                u.password = p
                u.password_confirmation = p
                if auth['provider'] == 'google_oauth2'
                    u.first_name = auth['info']['first_name'] 
                    u.last_name = auth['info']['last_name'] 
                else
                    u.first_name = auth['info']['name'].split(" ")[0]
                    u.last_name = auth['info']['name'].split(' ')[1]

                end
                u.image = auth['info']['image']
            end
        end
        user
    end
end
