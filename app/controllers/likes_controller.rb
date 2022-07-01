class LikesController < ApplicationController
  def index
    @likes = current_user.likes
    @pagy, @records = pagy(@likes, items: 10)
  end

  def create
    if liked?
      @like = current_user.likes.find_by(residence_id: params[:residence_id])
      @like.destroy
      redirect_to @like.residence
    else
      @like = current_user.likes.new(residence_id: params[:residence_id])
      @like.save
      redirect_to @like.residence
    end
  end

  private

  def liked?
    Like.where(user: current_user, residence_id: params[:residence_id]).exists?
  end
end
