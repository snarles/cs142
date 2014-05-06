class InitializeLogin < ActiveRecord::Migration
  def up
      down
      us = User.find(:all)
      us.each do |u|
          u.login = u.last_name
          u.save(:validate => false)
      end
  end
  
  def down
      us = User.find(:all)
      us.each do |u|
          u.login = nil
          u.save(:validate => false)
      end
  end
end
