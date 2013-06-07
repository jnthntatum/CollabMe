class PostsController < ApplicationController
  before_filter :require_login

  def create
    author = Researcher.find_by_id(params[:post][:creator_id])
    @post = Post.new({:desc => params[:post][:desc]})
    @post.creator = author
    if params[:project_id]
      project = Project.find_by_id(params[:project_id])
      project.posts << @post
      @post.save
      respond_to do |format|
        if @post.save
          format.html { redirect_to project_path(project)}
          format.json { render :json => @post, :status => :created, :location => @post }
        else
          format.html { redirect_to :back }
          format.json { render :json => @post.errors, :status => :unprocessable_entity }
        end
      end
      return
    elsif params[:researcher_id]
      researcher = Researcher.find_by_id(params[:researcher_id])
      researcher.posts << @post
      @post.save
      respond_to do |format|
        if @post.save
          format.html { redirect_to researcher_path(researcher)}
          format.json { render :json => @post, :status => :created, :location => @post }
        else
          format.html { redirect_to :back }
          format.json { render :json => @post.errors, :status => :unprocessable_entity }
        end
      end
      return
    elsif params[:group_id]
      group = Group.find_by_id(params[:group_id])
      group.posts << @post
      @post.save
      respond_to do |format|
        if @post.save
          format.html { redirect_to group_path(group)}
          format.json { render :json => @post, :status => :created, :location => @post }
        else
          format.html { redirect_to :back }
          format.json { render :json => @post.errors, :status => :unprocessable_entity }
        end
      end
      return
    end
    @post.desc = params[:post_text]
    @post.save
      respond_to do |format|
        if @post.save
          format.html { redirect_to  }
          format.json { render :json => @post, :status => :created, :location => @post }
        else
          format.html { redirect_to :back }
          format.json { render :json => @post.errors, :status => :unprocessable_entity }
        end
      end
  end

end
