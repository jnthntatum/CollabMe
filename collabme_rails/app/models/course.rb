class Course < ActiveRecord::Base
  attr_accessible :education_id, :course_title, :description

  belongs_to :education
end
