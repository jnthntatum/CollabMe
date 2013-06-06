class Education < ActiveRecord::Base
  attr_accessible :researcher_id, :school_id, :degree, :major, :specialization, :start_date, :end_date

  default_scope order('start_date DESC')

  belongs_to :researcher
  belongs_to :school
  has_many :courses
end
