class WorkExperiencesController < ApplicationController
  def add_work_experience
    work_experience = WorkExperience.new
    work_experience.researcher = Researcher.find_by_id(session[:current_user_id])
    work_experience.title = params[:title]
    work_experience.start_date = Time.new(params[:hidden_work_experience_start_date_year], params[:hidden_work_experience_start_date_month], 1)
    work_experience.end_date = Time.new(params[:hidden_work_experience_end_date_year], params[:hidden_work_experience_end_date_month], 1)
      
    if !params[:company_name].empty?
      company = Company.find_by_name_and_location(params[:company_name], params[:company_location])      
    
      if company        
        work_experience.company = company
      else
        company = Company.new
        company.name = params[:company_name]
        company.location = params[:company_location]
        
        if company.save
          work_experience.company = company
        end
      end      

      if work_experience.save
        params.each_key do |key|
          if key.start_with? 'activity_'
            activity = Activity.new
            index = key.to_s[-1]
            activity.activity = params['activity_' + index]
            activity.work_experience = work_experience
            activity.save
          end
        end

        flash[:notice] = 'New work experience saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]   
      else
        flash[:error] = 'New work experience not saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]
      end

    elsif !params[:research_lab_name].empty?
      research_lab = ResearchLab.find_by_name_and_location(params[:research_lab_name], params[:research_lab_location])

      if research_lab
        work_experience.research_lab = research_lab
      else
        research_lab = ResearchLab.new
        research_lab.name = params[:research_lab_name]
        research_lab.location = params[:research_lab_location]
        research_lab.focus = params[:research_lab_focus]

        if research_lab.save
          work_experience.research_lab = research_lab
        end
      end

      if work_experience.save
        params.each_key do |key|
          if key.start_with? 'activity_'
            activity = Activity.new
            index = key.to_s[-1]
            activity.activity = params['activity_' + index]
            activity.work_experience = work_experience
            activity.save
          end
        end

        flash[:notice] = 'New work experience saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]   
      else
        flash[:error] = 'New work experience not saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]
      end


    end
  end
end
