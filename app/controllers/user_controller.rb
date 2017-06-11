class UserController < ApplicationController

  def show
    @SalonApplying = SalonApplying.where(user_id: "#{current_user.id}")
    @SalonApproved = SalonApproved.where(user_id: "#{current_user.id}")
  end

  def profile_edit
    @user = User.find_by(id: params[:id])
  end

  def profile_update
    @user = User.find_by(id: params[:id])
    if @user.update(user_profile_params)
      redirect_to user_path(params[:id])
    else
      render 'user/profile_edit'
    end
  end

  private

  def user_profile_params
    params.require(:user).permit(:email, :nickname, :self_introduction)
  end

end
