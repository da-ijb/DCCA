class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  def create
    like = current_user.likes.create(post_id: params[:post_id])
    # redirect_back(fallback_location: root_path)
  end
  def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    like.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def set_like
      @post = Post.find(params[:post_id])
  end
end
