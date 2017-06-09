class SalonsController < ApplicationController
  before_action :correct_salon_user, only: :show

  def salon_index
    @SalonApplying = SalonApplying.new
    @salon_id = params[:id]
  end

  def show
    @salon_id = params[:id]
  end

  def owner
    @SalonApplyingMember = SalonApplying.where(owner_id: "#{current_owner.id}")
    @SalonApproved = SalonApproved.new
    @SalonApprovedMember = SalonApproved.where(owner_id: "#{current_owner.id}")
  end

  private

  def correct_salon_user
    #サロンに参加していない人はサロンのトップページにリダイレクトさせる
    if current_user.nil?
      redirect_to root_path unless current_owner.id == "#{params[:id]}".to_i
    else
      mysalon = SalonApproved.where(user_id: "#{current_user.id}").where(owner_id: "#{params[:id]}")
      redirect_to salon_index_owner_path(params[:id]) unless mysalon.exists?
    end
  end


end
