require 'json'

class SchoolsController < ApplicationController
  def index
    @schools = School.all
    respond_to do |format|
      format.json { render :json => @schools}
    end
  end
end
