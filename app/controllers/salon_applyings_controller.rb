class SalonApplyingsController < ApplicationController

  def create
    @SalonApplying = SalonApplying.new
    @SalonApplying.user_id = current_user.id
    @SalonApplying.owner_id = params[:salon_applying][:owner_id]
    if @SalonApplying.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

    def salon_applying_params
      params.require(:salon_applying).permit(:owner_id)
    end

end
