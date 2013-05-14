class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end
  
  def index
    @groups = Group.all
    respond_to do |f|
      f.html # show.html.erb
    end
  end
end

