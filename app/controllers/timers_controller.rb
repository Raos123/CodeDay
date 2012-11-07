class TimersController < ApplicationController
  respond_to :html
  before_filter :signed_in_user
  load_and_authorize_resource

  def index
    @timers = current_user.timers
  end

  def show
  end
  
  def new
  end
  
  def create
    @timer.user = current_user
    if @timer.save
      flash[:success] = "Timer was successfully created."
    end
    respond_with @timer
  end
  
  def edit
  end
  
  def update
    if @timer.update_attributes params[:timer]
      flash[:success] = "Timer was successfully updated."
    end
    respond_with @timer
  end
  
  def start
    @timer.start
    respond_with @timer
  end
  
  def stop
    @timer.stop
    respond_with @timer
  end
end