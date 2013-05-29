class GroupsController < ApplicationController
  def show
    id = params[:id]
    @group = Group.find_by_id(id)
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

