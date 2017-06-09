class PostsController < ApplicationController

  def index
    @salon_id = params[:owner_id]
  end


end
