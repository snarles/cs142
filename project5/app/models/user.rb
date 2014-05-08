require 'securerandom'

class User < ActiveRecord::Base
    has_many :photos
    has_many :comments
    validates :login, uniqueness: true
    attr_accessible :password
    
    def full_name
        first_name + ' '+ last_name
    end
    def password
        @password
    end
    def password=(newpass)
        @password = newpass
        salt = SecureRandom.hex
        password_digest = Digest::SHA2(newpass + salt)
    end
    def password_valid?(pw)
        return password_digest == Digest:SHA2(pw + salt)
    end
end
