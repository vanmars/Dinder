class UsersController < ApplicationController
  
  def show
    @user = current_user
    render :show
  end

  def edit
    @user = current_user
    render :edit
  end   

  def friends
    render :friends
  end
end
