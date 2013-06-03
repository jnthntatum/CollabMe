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
end

