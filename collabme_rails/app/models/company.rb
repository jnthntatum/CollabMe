class Company < ActiveRecord::Base
  attr_accessible :name, :location, :work_experience_id

  belongs_to :work_experience
  has_many :research_labs
end
