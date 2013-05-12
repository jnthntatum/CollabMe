class Resource < ActiveRecord::Base
  attr_accessible :type, :value
  belongs_to :resource_interface, :polymorphic =>true 
end
