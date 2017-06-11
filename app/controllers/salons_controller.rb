class SalonsController < ApplicationController
  before_action :correct_salon_user_for_index, only: :show
  before_action :correct_salon_owner_for_index, only: :owner

  def salon_index
    @SalonApplying = SalonApplying.new
    @salon_id = params[:id]

    @SalonInformation = SalonInformation.find_by(salon_id: "#{params[:id]}")
  end

  def show
    @salon_id = params[:id]
    @SalonInformation = SalonInformation.find_by(salon_id: "#{params[:id]}")
  end

  def owner
    @SalonInformation = SalonInformation.find_by(salon_id: "#{params[:id]}")

  end

  private

  def correct_salon_user_for_index
    #サロンに参加していない人はサロンのトップページにリダイレクトさせる
    if current_user.nil?
      # redirect_to root_path unless current_owner.id == "#{params[:id]}".to_i
      redirect_to root_path unless current_owner.present? && current_owner.id == "#{params[:id]}".to_i
    else
      mysalon = SalonApproved.where(user_id: "#{current_user.id}").where(owner_id: "#{params[:id]}")
      redirect_to salon_index_salon_path(params[:id]) unless mysalon.exists?
    end
  end

  def correct_salon_owner_for_index
    #サロンオーナー以外はサロンのトップページにリダイレクトさせる
    if current_owner.nil?
      redirect_to root_path
    else
      redirect_to root_path unless current_owner.id == "#{params[:id]}".to_i
    end
  end

end
