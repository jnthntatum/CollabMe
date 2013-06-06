class ResearchLab < ActiveRecord::Base
  attr_accessible :name, :location, :focus

  has_many :work_experiences
end
