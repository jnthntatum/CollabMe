class Friendship < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user, :class_name => "Researcher", :foreign_key => "user_id"; 
  belongs_to :friend, :class_name => "Researcher", :foreign_key => "friend_id"; 
end
