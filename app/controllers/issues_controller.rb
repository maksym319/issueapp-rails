class IssuesController < ApplicationController
  def show
    @issue = Issue.find(params[:id])
    @comments = @issue.comments
    @comment = Comment.new
  end

  def new
    @issue = Issue.new
    @project = Project.find(params[:project])
  end

  def issue_params
    params.require(:issue).permit(:project_id, :no, :title, :description, :assigned_to, :status)
  end

  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      redirect_to :controller => "projects", :action => "show", :id => @issue.project.id
    else
      @project = @issue.project
      render :action => "new", :project => @issue.project_id
    end
  end

  def edit
    @issue = Issue.find(params[:id])
    @project = @issue.project
  end

  def update
    @issue = Issue.find(params[:id])

    if @issue.update(issue_params)
      redirect_to :controller => "projects", :action => "show", :id => @issue.project.id
    else
      @project = @issue.project
      render :action => "edit"
    end
  end

  def destroy
    Issue.find(params[:id]).destroy
    redirect_to request.referrer
  end
end
