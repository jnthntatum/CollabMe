class Task < ActiveRecord::Base
  attr_accessible :desc, :type
  has_one :project
end
