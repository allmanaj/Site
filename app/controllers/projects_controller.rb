class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def create
  	@project = Project.create(project_params)
  	if(@project.save)
  		redirect_to root_url, :notice => "Project added"
  	else
  		render "new"
  	end
  end

  def new
  	@project = Project.new
  end


  private 

  def project_params
  	params.require(:project).permit(:title, :desc, :dates)
  end

end
