class SalonApprovedsController < ApplicationController

  def create
    @SalonApproved = SalonApproved.new
    @SalonApproved.owner_id = current_owner.id
    @SalonApproved.user_id = params[:salon_approved][:user_id]
    if @SalonApproved.save
      redirect_to root_path
    else
      redirect_to root_path
    end

  end


  private

    def salon_approved_params
      params.require(:salon_approved).permit(:user_id)
    end

end
