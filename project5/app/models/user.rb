require 'securerandom'
require 'digest'

class User < ActiveRecord::Base
    has_many :photos
    has_many :comments
    validates :login, uniqueness: true
    
    def full_name
        first_name + ' '+ last_name
    end
    def password
        @password
    end
    def password=(newpass)
        @password = newpass
        write_attribute(:salt,SecureRandom.hex)
        write_attribute(:password_digest, Digest::SHA2.hexdigest(newpass + salt))
    end
    def password_valid?(pw)
        return password_digest == (Digest::SHA2.hexdigest(pw + salt))
    end
end
