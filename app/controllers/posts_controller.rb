class PostsController < ApplicationController
  before_action :correct_salon_user, only: :index

  def index
    @salon_id = params[:salon_id]
  end


  private

  def correct_salon_user
    #サロンに参加していない人はサロンのトップページにリダイレクトさせる
    if current_user.nil?
      redirect_to root_path unless current_owner.id == "#{params[:salon_id]}".to_i
    else
      mysalon = SalonApproved.where(user_id: "#{current_user.id}").where(owner_id: "#{params[:salon_id]}")
      redirect_to salon_index_salon_path(params[:salon_id]) unless mysalon.exists?
    end
  end

end
