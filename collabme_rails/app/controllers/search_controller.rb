class SearchController < ApplicationController
  def search
  	type = params[:type]
  	type = type.to_i
  	@query = params[:q]
  	flash[:query] = params[:q]
  	if type == 1
  		redirect_to :action => "findResearchers"
  	end
  end

  def findResearchers
  	logger.debug @query
  	@query = flash[:query]
  	@researchers = Researcher.where("first_name LIKE ? OR last_name LIKE ?", @query, @query)
  end
end
