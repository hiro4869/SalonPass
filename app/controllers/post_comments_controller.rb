class PostCommentsController < ApplicationController

  def create
    @comment = PostComment.new(post_comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to salon_posts_path(params[:salon_id])
    else
      redirect_to salon_posts_path(params[:salon_id])
    end
  end


  private

  def post_comment_params
      params.require(:post_comment).permit(:body)
  end

end
