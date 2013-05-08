class ProjectsController < ApplicationController
	
	def show
		@project = Project.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json  { render :json => @project }
		end
	end
	
	def new
		@project = Project.new()
		respond_to do |format|
			format.html # new.html.erb
#			format.json 
		end
	end

	def create

		@project = Project.new(params[ :project ])
		
		respond_to do |format|   
			if @project.save
				format.html {redirect_to (@project)}
			else 
				format.html {render :action => "new"}
			end
		end
	end
	def index
		@projects = Project.all
		respond_to do |format|
			format.html # index.html.erb
		end
	end
end
