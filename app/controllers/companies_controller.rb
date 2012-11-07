class CompaniesController < ApplicationController
  respond_to :html
  before_filter :signed_in_user
  load_and_authorize_resource

  def new
  end

  def create
    if @company.save
      flash[:success] = 'Company successfully created.'
    end
    
    respond_with @company, location: current_user
  end
end
