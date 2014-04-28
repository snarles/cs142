class Comment < ActiveRecord::Base
    belongs_to :photo, :user
end
