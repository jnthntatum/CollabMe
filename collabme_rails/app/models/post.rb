class Post < ActiveRecord::Base
  attr_accessible :desc
  belongs_to :generic_post, :polymorphic => true
end
