class OwnerController < ApplicationController
  before_action :correct_salon_user, only: :show

  def salon_index
    @SalonApplying = SalonApplying.new
    @owner_id = params[:id]
  end

  def show
    # @salon = SalonApplying.where(user_id: "#{current_user.id}").where(owner_id: "#{params[:id]}")
    mysalon = SalonApplying.where(user_id: "#{current_user.id}").where(owner_id: "6")
    if mysalon.exists?
      @answer = "あるよ！"
    else
      @answer = "ないよ！"
    end



  end

  def owner
  end

  private

  def correct_salon_user
    #サロンに参加していない人はサロンのトップページにリダイレクトさせる
    mysalon = SalonApplying.where(user_id: "#{current_user.id}").where(owner_id: "#{params[:id]}")
    redirect_to salon_index_owner_path(params[:id]) unless mysalon.exists?
  end

end
