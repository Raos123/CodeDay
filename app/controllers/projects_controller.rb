class ProjectsController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  load_and_authorize_resource :company
  load_and_authorize_resource through: :company, shallow: true

  def index
    render json: @projects.map{|p| [p.name, p.id]}
  end

  def new
  end

  def create
    if @project.save
      flash[:success] = "Project successfully created."
    end
    respond_with @project
  end
end