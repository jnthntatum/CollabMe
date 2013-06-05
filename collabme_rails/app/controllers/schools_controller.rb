require 'json'

class SchoolsController < ApplicationController
  def index
    @schools = School.all
    respond_to do |format|
      format.json { render :json => @schools}
    end
  end

  def universities
    @schools = School.find_all_by_school_type('university')
    respond_to do |format|
      format.json { render :json => @schools}
    end
  end

  def high_schools
    @schools = School.find_all_by_school_type('high school')
    respond_to do |format|
      format.json { render :json => @schools}
    end
  end
end
