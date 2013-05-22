class ResearchersController < ApplicationController
  before_filter :authenticate_user

	include ResearchersHelper
	def index
		@researchers = Researcher.all
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @posts}
		end
	end	

	def show
	  @researcher = Researcher.find(params[:id])
	  @friends = @researcher.friends
	  respond_to do |format|
	    format.html  # show.html.erb
	    format.json  { render :json => @researcher }
	  end
	end

	def new
		@researcher = Researcher.new
		respond_to do |format|
			format.html # new.html.erb
		end
	end

	def create
		@researcher = Researcher.new(params[:researcher])
		respond_to do |format|
			if @researcher.save()
				format.html { redirect_to @researcher }
			else
				format.html { render new_researcher_path }
			end
		end
	end

	def login
		if session[:current_user_id]
      redirect_to logout_researchers_path
    end
	end

	def post_login
		if params[:researcher]
      email = params[:researcher][:email]
      password = params[:researcher][:password]
      if email.empty? || password.empty?
        if email.empty?
          flash.now[:error] = 'Sorry, please type in your email.'
        elsif password.empty?
          flash.now[:error] = 'Sorry, please type your password.'
        end
        render login_researchers_path
      else
        @researcher = Researcher.find_by_email(email)
        if @researcher
          if @researcher.password_valid?(password)
            session[:current_user_id] = @researcher.id
            session[:current_user_first_name] = @researcher.first_name
            redirect_to @researcher
          else
          	reset_session
            flash.now[:error] = 'Sorry, password does not match with email.'
            render login_researchers_path
          end
        else
        	reset_session
          flash.now[:error] = "Sorry, username with email #{email} does not exist."
          render login_researchers_path
        end
      end
    else
    	reset_session
      flash.now[:error] = 'Sorry, please login.'
      render login_researchers_path
    end
	end

	def logout
		reset_session
    flash[:notice] = 'You have successfully logged out.'
    redirect_to login_researchers_path
	end

  def edit
    @researcher = Researcher.find_by_id(params[:id])
  end

  def update
    if params[:id].to_i == session[:current_user_id]
      @researcher = Researcher.find_by_id(params[:id]) 
      if @researcher.update_attributes(:email => params[:researcher][:email])
        flash[:notice] = 'You have successfully changed your email.'
        redirect_to edit_researcher_path
      else
        flash[:error] = 'Email is invalid.'
        redirect_to edit_researcher_path
      end
    end
  end

  def authenticate_user
    unless session[:current_user_id] == params[:id]
      flash.now[:error] = 'You cannot access this section.'
      render 'shared/show_errors' 
    end
  end
end
