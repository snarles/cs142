class User < ActiveRecord::Base
    has_many :photos
    has_many :comments
    validates :login, uniqueness: true
end
