class ProjectsController < ApplicationController
  respond_to :html
  before_filter :signed_in_user
  load_and_authorize_resource

  def new
  end

  def create
    if @project.save
      flash[:success] = "Project successfully created."
    end
    respond_with @project
  end
end