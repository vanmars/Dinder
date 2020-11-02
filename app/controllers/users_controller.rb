class UsersController < ApplicationController
  
  def show
    @user = current_user
    render :show
  end

  def friends
    render :friends
  end
end
