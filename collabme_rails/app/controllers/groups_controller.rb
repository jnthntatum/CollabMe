class GroupsController < ApplicationController
  def show
    id = params[:id]
    @group = Group.find_by_id(id)
	  unless @group
	    flash[:notice] = "No such group with id: #{id}"
	    redirect_to :action => "index"
	  end
  end
  
  def index
    @groups = Group.all
    respond_to do |f|
      f.html # show.html.erb
    end
  end
end

