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
    respond_with @user, location: @user
  end

  def edit
  end

  def update
    if @user.save
      flash[:success] = "User updated"
    end
  end
end