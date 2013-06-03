class RequestsController < ApplicationController
  def index
    if params[:researcher_id]
      @researcher = Researcher.find_by_id(params[:researcher_id])
      @requests = @researcher.requests
    elsif params[:group_id]
      @group = Group.find_by_id(params[:group_id])
      @requests = @group.requests
    elsif params[:project_id]
      @project = Project.find_by_id(params[:project_id])
      @requests = @project.requests
    end 
  end
  
  def create
    owner = Researcher.find_by_id(session[:current_user_id])
    r = Request.new()
    r.owner = owner
    if params[:researcher_id]
      requestee = Researcher.find_by_id(params[:researcher_id])
      requestee.requests << r
      r.save()
      redirect_to researcher_path(requestee)
    elsif params[:group_id]
      group = Group.find_by_id(params[:group_id])
      group.requests << r
      r.save()
      redirect_to group_path(group)
    elsif params[:project_id]
      project = Project.find_by_id(params[:project_id])
      project.requests << r
      r.save()
      redirect_to project_path(project)
    end
  end
  
  def destroy
    @request = Request.find_by_id(params[:id])
    if (params[:request_confirm] == '3') #Ignore Action
      redirect_to :action => :index
    elsif (params[:request_confirm] == '1') #Confirm Action
      if params[:researcher_id]
        @curr_user = Researcher.find_by_id(params[:researcher_id])
        @curr_user.direct_friends << @request.owner
      elsif params[:project_id]
        @curr_project = Project.find_by_id(params[:project_id])
        @curr_project.members << @request.owner
      elsif params[:group_id]
        @curr_group = Group.find_by_id(params[:group_id])
        @curr_group.researchers << @request.owner
      end
      @request.destroy
      redirect_to :action => :index
    else  #Deny request
      @request.destroy
      redirect_to :action => :index
    end
  end
  
end
