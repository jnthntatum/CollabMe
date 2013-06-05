class WorkExperience < ActiveRecord::Base
  attr_accessible :researcher_id, :title, :company_id, :research_lab_id, :start_date, :end_date

  has_many :activities
  has_one :company
  has_one :research_lab
  belongs_to :researcher
end
