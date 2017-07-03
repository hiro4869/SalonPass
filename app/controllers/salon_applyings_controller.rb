class SalonApplyingsController < ApplicationController

  def show
    @SalonApplyingMember = SalonApplying.where(salon_id: params[:id])
    @SalonApproved = SalonApproved.new
  end

  def create
    if owner_signed_in? || user_signed_in?
      @SalonApplying = SalonApplying.new
      @SalonApplying.user_id = current_user.id
      @SalonApplying.salon_id = params[:salon_applying][:salon_id]
      if @SalonApplying.save
        redirect_to user_path(current_user)
      else
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end

  end

  def destroy
    @SalonApplying = SalonApplying.find(params[:id])
    @SalonApplying.destroy
    redirect_to salon_applying_path(current_owner.id) 
  end

  def refusal
    @SalonApplying = SalonApplying.where(salon_id: "#{params[:salon_applying][:salon_id]}").find_by(user_id: "#{current_user.id}")
    @SalonApplying.destroy
    redirect_to salon_management_user_path(current_user.id)
  end

  private

    def salon_applying_params
      params.require(:salon_applying).permit(:salon_id)
    end

end
