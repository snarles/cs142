class User < ActiveRecord::Base
    has_many :photos
    has_many :comments
    validates :login, uniqueness: true
    
    def full_name
        first_name + ' '+ last_name
    end
end
