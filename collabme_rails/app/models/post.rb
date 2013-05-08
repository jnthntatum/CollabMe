class Post < ActiveRecord::Base
  attr_accessible :desc
  belongs_to :post_interface, :polymorphic => true
end
