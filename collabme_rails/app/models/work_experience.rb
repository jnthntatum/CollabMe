class WorkExperience < ActiveRecord::Base
  attr_accessible :researcher_id, :title, :company, :location, :start_date, :end_date

  has_many :activities
  belongs_to :researcher
end
