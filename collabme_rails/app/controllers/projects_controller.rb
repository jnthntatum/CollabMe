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
		
		if params.has_key?(:researcher_id)
			owner = Researcher.find(params[:researcher_id]);
			@project.owner = owner;
		end 

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

	def add_member
		id = 
		if params.has_key?(:id) then 
			params[:id].to_i 
		else 
			(params.has_key?(:project_id))? params[:project_id]: nil 
		end
		member = 
		if params.has_key?(:researcher_id) then
		 	params[:researcher_id].to_i
		else 
		 	nil 
		end
		@project = Project.find(id)
		member = Researcher.find(member)
		respond_to do |f|
			if @project.members.include?(member)
				f.html {redirect_to(@project, :notice => "#{member.first_name} already added")}
			end
			@project.members << member
			if @project.save()
				@notify = "#{member.first_name} added to #{@project.name}"
				f.html {redirect_to(@project, :notice => @notify)};
			else
				@notify = "Error : #{@project.errors[:name]}"
				f.html {redirect_to(@project, :notice => @notify)} 
			end
		end
	end

end
