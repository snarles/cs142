class Photo < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    validates :file_name, uniqueness: true
end
