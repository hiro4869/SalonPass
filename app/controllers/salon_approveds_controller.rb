class SalonApprovedsController < ApplicationController

  def show
    @SalonApprovedMember = SalonApproved.where(owner_id: params[:id])
  end

  def create
    @SalonApproved = SalonApproved.new
    @SalonApproved.owner_id = current_owner.id
    @SalonApproved.user_id = params[:salon_approved][:user_id]

    @SalonApplying = SalonApplying.where(user_id: "#{params[:salon_approved][:user_id]}").where(owner_id: "#{current_owner.id}")

    if @SalonApproved.save
      @SalonApplying.delete_all
      redirect_to owner_salon_path(current_owner.id)
    else
      redirect_to owner_salon_path(current_owner.id)
    end

  end


  private

    def salon_approved_params
      params.require(:salon_approved).permit(:user_id)
    end

end
