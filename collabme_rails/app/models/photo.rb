class Photo < ActiveRecord::Base
  attr_accessible :file_name

  belongs_to :photo_interface, :polymorphic => true

  validates :file_name, :presence => true
end
