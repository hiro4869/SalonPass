class SalonApplyingsController < ApplicationController

  def show
    @SalonApplyingMember = SalonApplying.where(salon_id: params[:id])
    @SalonApproved = SalonApproved.new
  end

  def create
    @SalonApplying = SalonApplying.new
    @SalonApplying.user_id = current_user.id
    @SalonApplying.salon_id = params[:salon_applying][:salon_id]
    if @SalonApplying.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

    def salon_applying_params
      params.require(:salon_applying).permit(:salon_id)
    end

end
