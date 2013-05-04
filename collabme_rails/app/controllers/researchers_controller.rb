class ResearchersController < ApplicationController
	def index
		@researchers = Researcher.all
		respond_to do |format|
			format.html # index.html.erb
			format.json {render :json => @posts}
		end
	end	

	def show
	  @researcher = Researcher.find(params[:id])
	 
	  respond_to do |format|
	    format.html  # show.html.erb
	    format.json  { render :json => @researcher }
	  end
	end
end
