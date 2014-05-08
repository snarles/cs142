class InitializePasswords < ActiveRecord::Migration
  def up
      down
      us = User.find(:all)
      us.each do |u|
          u.password= u.last_name
          u.save(:validate => false)
      end
  end
  
  def down
      us = User.find(:all)
      us.each do |u|
          u.password_digest = ""
          u.salt = ""
          u.save(:validate => false)
      end
  end
end
