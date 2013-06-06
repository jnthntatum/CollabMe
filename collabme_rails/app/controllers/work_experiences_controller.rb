class WorkExperiencesController < ApplicationController
  def add_work_experience
    work_experience = WorkExperience.new
    work_experience.researcher = Researcher.find_by_id(session[:current_user_id])
    work_experience.start_date = Time.new(params[:hidden_work_experience_start_date_year], params[:hidden_work_experience_start_date_month], 1)
    work_experience.end_date = Time.new(params[:hidden_work_experience_end_date_year], params[:hidden_work_experience_end_date_month], 1)
      
    if params[:company_name]
      work_experience.degree = params[:degree]
      work_experience.major = params[:major]
      work_experience.specialization = params[:specialization]

      university = School.find_by_name_and_location(params[:university_name], params[:university_location])      
    
      if university        
        work_experience.school = university
      else
        university = School.new
        university.name = params[:university_name]
        university.location = params[:university_location]
        university.school_type = 'university'
        
        if university.save
          work_experience.school = university
        end
      end      

      if work_experience.save
        params.each_key do |key|
          if key.start_with? 'course_title_'
            course = Course.new
            index = key.to_s[-1]
            course.course_title = params['course_title_' + index]
            course.description = params['course_description_' + index]
            course.work_experience = work_experience
            course.save
          end
        end

        flash[:notice] = 'New work_experience saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]   
      else
        flash[:error] = 'New work_experience not saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]
      end

    elsif params[:high_school_name]
      high_school = School.find_by_name_and_location(params[:high_school_name], params[:high_school_location])

      if high_school
        work_experience.school = high_school
      else
        high_school = School.new
        high_school.name = params[:high_school_name]
        high_school.location = params[:high_school_location]
        high_school.school_type = 'high school'
        
        if high_school.save
          work_experience.school = high_school
        end
      end
    end
  end
end
