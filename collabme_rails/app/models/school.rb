class School < ActiveRecord::Base
  attr_accessible :name, :location, :school_type

  has_many :researchers, :through => :educations 
end
