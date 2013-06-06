class TasksController < ApplicationController

def create
  @task = Task.new()
  @task.desc = params[:task][:desc]
  @task.project = Project.find_by_id(params[:task][:project_id])
  @task.creator = Researcher.find_by_id(params[:task][:creator_id])
  @task.assignee = Researcher.find_by_id(params[:task][:assignee_id])
  @task.category = params[:task][:category]
  if @task.save()
    redirect_to project_path(@task.project)
  end
end

end
