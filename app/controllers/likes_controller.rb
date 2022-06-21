class LikesController < ApplicationController
  def index
    @likes = Like.where(user: current_user)
    @pagy, @records = pagy(@likes, items: 10)
  end

  def create
    if liked?
      @like = Like.find_by(user: current_user, residence_id: params[:residence_id])
      @like.destroy
      redirect_to @like.residence
    else
      @like = Like.new(user: current_user, residence_id: params[:residence_id])
      @like.save
      redirect_to @like.residence
    end
  end

  private

  def liked?
    Like.where(user: current_user, residence_id: params[:residence_id]).exists?
  end
end
