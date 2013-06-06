class ResearchLabsController < ApplicationController
  def research_labs
    @research_labs = ResearchLab.all
    respond_to do |format|
      format.json { render :json => @research_labs}
    end
  end
end
