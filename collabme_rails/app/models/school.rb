class School < ActiveRecord::Base
  attr_accessible :name, :location, :education_id, :school_type

  belongs_to :education
  has_many :research_labs
end
