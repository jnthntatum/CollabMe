class EducationsController < ApplicationController
  def add_education
    education = Education.new
    education.researcher = Researcher.find_by_id(session[:current_user_id])
    education.start_date = Time.new(params[:hidden_education_start_date_year], params[:hidden_education_start_date_month], 1)
    education.end_date = Time.new(params[:hidden_education_end_date_year], params[:hidden_education_end_date_month], 1)
      
    if !params[:university_name].empty?
      education.degree = params[:degree]
      education.major = params[:major]
      education.specialization = params[:specialization]

      university = School.find_by_name_and_location(params[:university_name], params[:university_location])      
    
      if university        
        education.school = university
      else
        university = School.new
        university.name = params[:university_name]
        university.location = params[:university_location]
        university.school_type = 'university'
        
        if university.save
          education.school = university
        end
      end      

      if education.save
        params.each_key do |key|
          if key.start_with? 'course_title_'
            course = Course.new
            index = key.to_s[-1]
            course.course_title = params['course_title_' + index]
            course.description = params['course_description_' + index]
            course.education = education
            course.save
          end
        end

        flash[:notice] = 'New education saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]   
      else
        flash[:error] = 'New education not saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]
      end

    elsif !params[:high_school_name].empty?
      high_school = School.find_by_name_and_location(params[:high_school_name], params[:high_school_location])

      if high_school
        education.school = high_school
      else
        high_school = School.new
        high_school.name = params[:high_school_name]
        high_school.location = params[:high_school_location]
        high_school.school_type = 'high school'
        
        if high_school.save
          education.school = high_school
        end
      end

      if education.save
        flash[:notice] = 'New education saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]   
      else
        flash[:error] = 'New education not saved.'
        redirect_to :controller => :researchers, :action => :edit, :id => session[:current_user_id]
      end
    end
  end
end
