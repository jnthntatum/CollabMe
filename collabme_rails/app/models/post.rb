class Post < ActiveRecord::Base
  attr_accessible :desc, :title
  belongs_to :post_interface, :polymorphic => true
  belongs_to :creator, :class_name => "Researcher", :foreign_key => "creator_id"
end
