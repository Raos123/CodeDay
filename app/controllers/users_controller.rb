class UsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def new
  end

  def create
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the TimeKeeping System!"
    end
    respond_with @user
  end

  def edit
  end

  def update
    if @user.update_attributes params[:user]
      flash[:success] = "Profile was successfuly updated."
    end
    respond_with [:edit, @user]
  end
end