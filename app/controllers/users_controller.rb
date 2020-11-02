class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if params[:add_friend]
      current_user.friends << @user
      redirect_to user_path(current_user)
    end
    render :show

  end

  def friends
    @user = User.find(params[:id])
    if params[:friend_search]
      @friends = User.friend_search(params[:friend_search])
    end
    render :friends
  end
end
