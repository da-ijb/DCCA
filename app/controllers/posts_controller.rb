class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :show, :update, :destroy]
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def edit
    unless current_user == @post.user
      redirect_to root_path
    end  
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit  
    end  
  end  

  def destroy
    if current_user == @post.user
    @post.destroy
    redirect_to root_path
    else
      render :show
    end  
  end

  def set_post
    @post = Post.find(params[:id])
  end  

  private
  def post_params
    params.require(:post).permit(:name, :kind_id, :gender_id, :description, :image).merge(user_id: current_user.id)
  end  
end
