class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
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

  def edit
    @post = Post.find(params[:id])
    unless current_user == @post.user
      redirect_to root_path
    end  
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit  
    end  
  end  

  private
  def post_params
    params.require(:post).permit(:name, :kind_id, :gender_id, :description, :image).merge(user_id: current_user.id)
  end  
end
