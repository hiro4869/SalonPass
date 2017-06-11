class OwnerController < ApplicationController

  def profile_edit
    @owner = Owner.find_by(id: params[:id])
  end

  def profile_update
    @owner = Owner.find_by(id: params[:id])
    if @owner.update(owner_profile_params)
      redirect_to owner_salon_path(params[:id])
    else
      render 'owner/profile_edit'
    end
  end

  private

  def owner_profile_params
    params.require(:owner).permit(:email, :nickname, :self_introduction)
  end

end
