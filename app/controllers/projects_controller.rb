class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @issues = @project.issues
  end

  def new
    @project = Project.new
  end

  def project_params
    params.require(:project).permit(:name)
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to :action => "show", :id => @project
    else
      render :action => "edit"
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to :action => "index"
  end
end
