class UsersController < ApplicationController
  
  def show
    @user = current_user
    render :show
  end

  def edit
    @user = current_user
    render :edit
  end  

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Profile update succesfully!"
      redirect_to 'user#show'
    else
      flash[:alert] = "Uh oh...there was an error updating your profile."
      render :edit
    end
  end  

  def friends
    render :friends
  end
end
