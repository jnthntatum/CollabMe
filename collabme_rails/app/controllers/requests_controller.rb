class RequestsController < ApplicationController
  def index
    @researcher = Researcher.find_by_id(params[:researcher_id])
  end
  
  def create
    owner = Researcher.find_by_id(session[:current_user_id])
    r = Request.new()
    r.owner = owner
    requestee = Researcher.find_by_id(params[:researcher_id])
    requestee.requests << r
    r.save()
    redirect_to researcher_path(requestee)
  end
  
  def destroy
    @request = Request.find_by_id(params[:id])
    if (params[:request_confirm] == '3') #Ignore Action
      redirect_to :action => :index
    elsif (params[:request_confirm] == '1') #Confirm Action
      @curr_user = Researcher.find_by_id(params[:researcher_id])
      @curr_user.direct_friends << @request.owner
      @request.destroy
      redirect_to :action => :index
    else  #Deny request
      @request.destroy
      redirect_to :action => :index
    end
  end
  
end
