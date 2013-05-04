class Project < ActiveRecord::Base
  belongs_to :Researcher
  attr_accessible :name
end
