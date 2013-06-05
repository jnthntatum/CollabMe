class ResearchLab < ActiveRecord::Base
  attr_accessible :name, :location, :focus, :school_id, :company_id, :work_experience_id

  belongs_to :work_experience
  belongs_to :company
  belongs_to :school
end
