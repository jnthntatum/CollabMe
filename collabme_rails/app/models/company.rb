class Company < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :researchers, :through => :work_experiences
end
