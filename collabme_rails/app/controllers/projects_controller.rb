class ProjectsController < ApplicationController	
	def show
	  id = params[:id]
		@project = Project.find_by_id(id)
		unless @project
		  flash[:notice] = "No such project with id: #{id}"
	    redirect_to :action => "index"
	    return
	  end
	  @currUserIsOwner = false
	  if session[:current_user_id] == @project.owner.id
	    @currUserIsOwner = true
	  end
	  @currUserIsMember = @currUserIsOwner
	  if session[:current_user_id] and not @currUserIsMember
	    @project.members.each do |m|
	      if m.id == session[:current_user_id]
	        @currUserIsMember = true
	      end
	    end
	  end
	  if @currUserIsMember
	    @newTask = Task.new()
	    @newTask.project = @project
	    @newTask.creator = Researcher.find_by_id(session[:current_user_id])
	  end
	  @hasRequested = false
	  if session[:current_user_id]
	    @project.requests.each do |r|
	      if r.owner.id == session[:current_user_id]
	        @hasRequested = true
	      end
	    end
	  end
		@posts = @project.posts
		@tasks = @project.tasks
		    	  
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
	
	def edit
	  @project = Project.find_by_id(params[:id])
	end
	
	def update
    @project = Project.find_by_id(params[:id]) 
    if @project.update_attributes(params[:project])
      flash[:notice] = 'You have successfully updated the project.'
      redirect_to @project
    else
      flash[:error] = 'Invalid update.'
      redirect_to edit_project_path
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

	def edit_profile_picture
    @project = Project.find_by_id(params[:id])
  end

  def upload_picture
    upload = params[:photo]
    if upload      
      @project = Project.find_by_id(params[:id])
      
      @photo = Photo.new
      @photo.file_name = 'profile_pictures/' + Time.now.to_i.to_s + '_' + upload[:file].original_filename
      @project.photo = @photo
      
      if @photo.save
        File.open(Rails.root.join('app/assets', 'images', @photo.file_name), 'wb') do |f|
          f.write(upload[:file].read)
        end
        redirect_to :controller => 'projects', :action => 'show', :id => params[:id]
      else
        flash.now[:error] = 'Sorry, file not saved.'
        render edit_profile_picture_project_path
      end
    else
      flash.now[:error] = 'Sorry, file not uploaded.'
      @project = Project.find_by_id(params[:id])
      render edit_profile_picture_project_path
    end
  end

end
