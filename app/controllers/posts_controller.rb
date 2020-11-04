class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end    
  end 

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:name, :kind_id, :gender_id, :description, :image).merge(user_id: current_user.id)
  end  
end
