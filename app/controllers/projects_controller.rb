class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @issues = Project.find(params[:id]).issues
  end
end
