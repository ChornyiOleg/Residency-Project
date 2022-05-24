class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def new
    @post = Post.new
  end

  def create
    #render plain: params[:article].inspect
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post was successfully created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

    if @post.update(post_params)
      flash[:notice] = "Post was updated"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Post was not updated"
      render 'edit'
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post.destroy
    flash[:notice] = "Postwas deleted"
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:name, :image, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end