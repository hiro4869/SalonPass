class SalonApprovedsController < ApplicationController

  def show
    @SalonApprovedMember = SalonApproved.where(salon_id: params[:id])
  end

  def create
    @SalonApproved = SalonApproved.new
    @SalonApproved.salon_id = current_owner.id
    @SalonApproved.user_id = params[:salon_approved][:user_id]

    @SalonApplying = SalonApplying.where(user_id: "#{params[:salon_approved][:user_id]}").where(salon_id: "#{current_owner.id}")

    if @SalonApproved.save
      @SalonApplying.destroy_all
      redirect_to salon_applying_path(current_owner.id)
    else
      redirect_to owner_salon_path(current_owner.id)
    end
  end

  def destroy
    @SalonApproved = SalonApproved.find(params[:id])
    @SalonApproved.destroy
    redirect_to salon_approved_path(current_owner.id) 
  end

  #ユーザーが脱退するアクション
  def leave
    @SalonApproved = SalonApproved.where(salon_id: "#{params[:salon_approved][:salon_id]}").find_by(user_id: "#{current_user.id}")
    @SalonApproved.destroy
    redirect_to salon_management_user_path(current_user.id)
  end

  private

    def salon_approved_params
      params.require(:salon_approved).permit(:user_id, :salon_id)
    end

end
