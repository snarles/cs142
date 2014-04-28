class Photo < ActiveRecord::Base
    belongs_to :student
    has_many :comments
end
