class SearchController < ApplicationController

  Appearance = Struct.new(:researcherID, :priority)

  def search
  	type = params[:type]
  	type = type.to_i
  	@query = params[:q]
  	flash[:query] = params[:q]
  	if type == 1
  		redirect_to :action => "findResearchers"
    elsif type == 2
      redirect_to :action => "findGroups"
    elsif type == 3
      redirect_to :action => "findProjects"
  	end
  end

  def findResearchers
  	logger.debug @query
  	@query = flash[:query]
    searchTerms = @query.split
    @results = []
    searchTerms.each do |term|
      term = '%' + term + '%'
      researchersFirstName = Researcher.where("first_name LIKE ?", term)
      unless researchersFirstName.empty?
        @results += researchersFirstName
      end
      researchersLastName = Researcher.where("last_name LIKE ?", term)
      unless researchersLastName.empty?
        @results += researchersLastName
      end
      @tagged = Researcher.tagged_with(term)
      unless @tagged.empty?
        @results += @tagged
      end
      schools = School.where("name LIKE ?", term)
      schools.each do |school|
        @results += school.researchers
      end

      schools = School.where("name LIKE ?", term)
      schools.each do |school|
        @results += school.researchers
      end

      schools = School.where("location LIKE ?", term)
      schools.each do |school|
        @results += school.researchers
      end

      companies = Company.where("name LIKE ?", term)
      companies.each do |company|
        @results += company.researchers
      end

      companies = Company.where("location LIKE ?", term)
      companies.each do |company|
        @results += company.researchers
      end

      labs = ResearchLab.where("name LIKE ?", term)
      labs.each do |lab|
        @results += lab.researchers
      end

      labs = ResearchLab.where("location LIKE ?", term)
      labs.each do |lab|
        @results += lab.researchers
      end

    end

    @researchers = @results

    unique = Hash.new(0)
    @researchers.each do |researcher|
      unique[researcher.id] += 1
    end
    require 'pqueue'

    arrayForPQ = []
    unique.each do | key, value|
      version = Appearance.new(key, value)
      arrayForPQ += [version] 
    end


    @pq = PQueue.new(arrayForPQ){ |a,b| a[:priority] > b[:priority] }
    
  end

   def findGroups
    logger.debug @query
    @query = flash[:query]
    @groups = Group.where("name LIKE ?", @query)
    @tagged = Group.tagged_with(@query)
    @groups.concat(@tagged)
    @groupsCheck = @groups
    @groupsCheck.uniq!
    if !@groupsCheck.nil?
      @groups = @groupsCheck
    end

  end

   def findProjects
    logger.debug @query
    @query = flash[:query]
    @projects = Project.where("name LIKE ?", @query)
    @tagged = Project.tagged_with(@query)
    @orojects.concat(@tagged)
    @projectsCheck = @projects
    @projectsCheck.uniq!
    if !@projectsCheck.nil?
      @projects = @projectsCheck
    end
  end
end
