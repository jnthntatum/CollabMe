class Education < ActiveRecord::Base
  attr_accessible :researcher_id, :school_name, :degree, :major, :specialization, :start_date, :end_date

  belongs_to :researcher
  has_many :courses
end
