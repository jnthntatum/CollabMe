class Activity < ActiveRecord::Base
  attr_accessible :work_experience_id, :activity

  belongs_to :work_experience
end
