class ResearchersController < ApplicationController
  before_filter :authenticate_user, :only => [:email, :edit, :update, :edit_profile_picture, :upload_picture]

  include ResearchersHelper
	
	def index
		@researchers = Researcher.all
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @posts}
		end
	end	

	def show
	  @currentUserPage = false
	  if session[:current_user_id] and session[:current_user_id] == params[:id].to_i
	    @currentUserPage = true
	  end
	  id = params[:id]
	  @user = Researcher.find_by_id(id)
	  unless @user
	    flash[:notice] = "No such user with id: #{id}"
	    redirect_to :action => "index"
	    return
	  end
	  @friends = @user.friends
	  respond_to do |format|
	    format.html  # show.html.erb
	    format.json  { render :json => @user }
	  end
	end

  def email
    @recipient = Researcher.find_by_id(params[:id].to_i)
    @sender = Researcher.find_by_id(session[:current_user_id])
    if request.post?
      if not params[:Body]
        flash[:notice] = "Can't send an empty email!"
        redirect_to :action => "email"
        return
      elsif not params[:Subject]
        flash[:notice] = "Can't send an email with an empty subject!"
        redirect_to :action=> "email"
        return
      else
        respond_to do |format|
          UserMailer.user_email(@recipient, @sender, params[:Subject], params[:Body]).deliver
          format.html { redirect_to(@recipient, :notice => 'Researcher was successfully emailed.') }
				  format.json  { render :json => @researcher }
				end
      end
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
			if @researcher.save
			  UserMailer.welcome_email(@researcher).deliver
				#format.html { redirect_to (@researcher,  => 'User was successfully created.') }
				format.html { redirect_to(@researcher, :notice => 'User registration was successfully emailed.') }
        
				format.json  { render :json => @researcher }
			else
				format.html { render new_researcher_path }
				format.json { render :json => @researcher.errors}
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
    @researcher = Researcher.find_by_id(params[:id]) 
    if @researcher.update_attributes(:email => params[:researcher][:email])
      flash[:notice] = 'You have successfully changed your email.'
      redirect_to edit_researcher_path
    else
      flash[:error] = 'Email is invalid.'
      redirect_to edit_researcher_path
    end
  end

  def addInterest
    @researcher = Researcher.find_by_id(params[:id]) 
    if params[:tag].length > 0
      @researcher.interest_list.add(params[:tag])
      @researcher.save
    end
    redirect_to @researcher
  end

  def addSkill
    @researcher = Researcher.find_by_id(params[:id]) 
    if params[:tag].length > 0
      @researcher.skill_list.add(params[:tag])
      @researcher.save
    end
    redirect_to @researcher
  end

  def removeSkill
    @researcher = Researcher.find_by_id(params[:id]) 
    if params[:tag].length > 0
      @researcher.skill_list.remove(params[:tag])
      @researcher.save
    end
    redirect_to @researcher
  end

  def removeInterest
    @researcher = Researcher.find_by_id(params[:id]) 
    if params[:tag].length > 0
      @researcher.interest_list.remove(params[:tag])
      @researcher.save
    end
    redirect_to @researcher
  end

  def authenticate_user
    if session[:current_user_id].nil?
      flash[:error] = 'You must be logged in to access this section.' 
      redirect_to login_researchers_path
    elsif params[:id].to_i != session[:current_user_id]
      flash.now[:error] = 'You cannot access this section.' 
      render 'shared/_error'
    end
  end

  def edit_profile_picture
    @user = Researcher.find_by_id(params[:id])
  end

  def upload_picture
    upload = params[:photo]
    if upload
      time = Time.now.to_i.to_s
      
      @user = Researcher.find_by_id(params[:id])
      if @user.photo
        @photo = @user.photo
      else
        @photo = Photo.new
        @photo.researcher = @user
      end
      p upload
      p '**********************'
      p upload[:file].original_filename
      @photo.file_name = time + '_' + upload[:file].original_filename
      
      if @photo.save
        File.open(Rails.root.join('app/assets', 'images', @photo.file_name), 'wb') do |f|
          f.write(upload[:file].read)
        end
        redirect_to :controller => 'researchers', :action => 'show', :id => session[:current_user_id] 
      else
        flash.now[:error] = 'Sorry, file not saved.'
        render edit_profile_picture_researcher_path
      end
    else
      flash.now[:error] = 'Sorry, file not uploaded.'
      @user = Researcher.find_by_id(params[:id])
      render edit_profile_picture_researcher_path
    end
  end
end
