class GroupsController < ApplicationController
  def show
    id = params[:id]
    @group = Group.find_by_id(id)
    @currUserInGroup = false
    if session[:current_user_id]
      @currUser = Researcher.find_by_id(session[:current_user_id])
    end
    if @currUser and @group.researchers.include?(@currUser)
      @currUserInGroup = true
    end
    @hasRequested = false
	  if session[:current_user_id]
	    @group.requests.each do |r|
	      if r.owner.id == session[:current_user_id]
	        @hasRequested = true
	      end
	    end
	  end
	  unless @group
	    flash[:notice] = "No such group with id: #{id}"
	    redirect_to :action => "index"
	  end
  end
  
  def new
		@group = Group.new()
		respond_to do |format|
			format.html # new.html.erb
#			format.json 
		end
	end
	
	def edit
	  @group = Group.find_by_id(params[:id])
	end
	
	def update
    @group = Group.find_by_id(params[:id]) 
    if @group.update_attributes(params[:group])
      flash[:notice] = 'You have successfully updated the group.'
      redirect_to @group
    else
      flash[:error] = 'Invalid update.'
      redirect_to edit_group_path
    end
  end
	
  def create

		@group = Group.new(params[:group])
		
		if params.has_key?(:first_member)
			member = Researcher.find(params[:first_member])
			@group.researchers << member
		end 

		respond_to do |format|   
			if @group.save
				format.html {redirect_to (@group)}
			else 
				format.html {render :action => "new"}
			end
		end
	end
  
  def index
    @groups = Group.all
    respond_to do |f|
      f.html # show.html.erb
    end
  end

  def edit_profile_picture
    @group = Group.find_by_id(params[:id])
  end

  def upload_picture
    upload = params[:photo]
    if upload      
      @group = Group.find_by_id(params[:id])
      
      @photo = Photo.new
      @photo.file_name = 'profile_pictures/' + Time.now.to_i.to_s + '_' + upload[:file].original_filename

      @group.photo = @photo
      
      if @photo.save
        File.open(Rails.root.join('app/assets', 'images', @photo.file_name), 'wb') do |f|
          f.write(upload[:file].read)
        end
        redirect_to :controller => 'groups', :action => 'show', :id => params[:id]
      else
        flash.now[:error] = 'Sorry, file not saved.'
        render edit_profile_picture_group_path
      end
    else
      flash.now[:error] = 'Sorry, file not uploaded.'
      @group = Group.find_by_id(params[:id])
      render edit_profile_picture_group_path
    end
  end
end

