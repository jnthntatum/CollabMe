class Photo < ActiveRecord::Base
  attr_accessible :user_id, :file_name

  belongs_to :researcher
  validates :file_name, :presence => true
end
