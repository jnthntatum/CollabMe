class SearchController < ApplicationController
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
    end

    @researchers = @results

    unique = Hash.new(0)
    @researchers.each do |researcher|
      unique[researcher.id] += 1
    end

    
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
