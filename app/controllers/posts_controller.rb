class PostsController < ApplicationController
  def index
    @posts = Post.all
    @pagy, @posts = pagy(Post.order(created_at: :desc), items: 5)
  end

  def show; end
end
