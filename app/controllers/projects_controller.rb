class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy ]

  def create
    @project = Project.create(project_params)
    if @project.save
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def index
    projects = Project.all
    render json: projects
  end

  def show
    render json: @project
  end

  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :email, :age)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
