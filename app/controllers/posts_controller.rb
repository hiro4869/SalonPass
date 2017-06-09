class PostsController < ApplicationController
  before_action :correct_salon_user, only: :index
  before_action :correct_salon_owner, only: :new


  def index
    @salon_id = params[:salon_id]
    @posts = Post.where(salon_id: "#{params[:salon_id]}")
  end

  def new
    @post = Post.new
    @salon_id = params[:salon_id]
  end

  def create
    @post = Post.new(post_params)
    @post.salon_id = params[:salon_id]
    if @post.save
     redirect_to owner_salon_path(params[:salon_id])
    else
      render 'posts/new'
    end
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

  def correct_salon_owner
    #サロンオーナー以外はサロンのトップページにリダイレクトさせる
    if current_owner.nil?
      redirect_to root_path
    else
      redirect_to root_path unless current_owner.id == "#{params[:salon_id]}".to_i
    end
  end

  def post_params
      params.require(:post).permit(:title, :body)
  end


end
