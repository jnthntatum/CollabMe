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

	def new
		@researcher = Researcher.new()
		respond_to do |format|
			format.html # new.html.erb
		end
	end

	def create
		@researcher = Researcher.new(params[:researcher])
		respond_to do |format|
			if @researcher.save()
				format.html {redirect_to(@researcher)}
			else
				if @researcher.errors.any?
					@errors = @researcher.errors
				else
					@researchers = Researcher.all
				end
				format.html {render :action => "index"}
			end
		end
	end
end
