class SearchController < ApplicationController
  def search
  	type = params[:type]
  	type = type.to_i
  	@query = params[:q]
  	flash[:query] = params[:q]
  	if type == 1
  		redirect_to :action => "findResearchers"
    elsif type == 2
      redirect_to :action => "findGroups"
    elsif type == 3
      redirect_to :action => "findProjects"
  	end
  end

  def findResearchers
  	logger.debug @query
  	@query = flash[:query]
  	@researchers = Researcher.where("first_name LIKE ? OR last_name LIKE ?", @query, @query)
  end

   def findGroups
    logger.debug @query
    @query = flash[:query]
    @groups = Group.where("name LIKE ?", @query)
  end

   def findProjects
    logger.debug @query
    @query = flash[:query]
    @projects = Project.where("name LIKE ?", @query)
  end
end
