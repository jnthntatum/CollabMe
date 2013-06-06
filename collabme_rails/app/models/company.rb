class Company < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :work_experiences
end
