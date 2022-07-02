class PostsController < ApplicationController
  def index
    @posts = Post.all
    @pagy, @posts = pagy(Post.order(created_at: :desc), items: 6)
  end

  def show
    @post = Post.find(params[:id])
  end
end
