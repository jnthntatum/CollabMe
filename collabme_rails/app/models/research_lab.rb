class ResearchLab < ActiveRecord::Base
  attr_accessible :name, :location, :focus

  has_many :work_experiences
  has_many :researchers, :through => :work_experiences
end
