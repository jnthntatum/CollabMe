class Post < ActiveRecord::Base
  attr_accessible :desc, :title
  belongs_to :post_interface, :polymorphic => true
end
