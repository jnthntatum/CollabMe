class SearchController < ApplicationController
  def search
  	type = params[:type]
  	if type == 1
  		redirect_to :action => "findResearchers"
  	end
  end

  def findResearchers
  	@researchers = Researcher.search params[:q]
  end
end
