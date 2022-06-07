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
        if @like.save
          flash[:success] = 'Comment created!'
          redirect_to @like.residence
        else
          @likes = Like.order created_at: :desc
          redirect_to root_path
        end 
    end
  end

  private

  def liked?
    Like.where(user: current_user, residence_id: params[:residence_id]).exists?
  end
  
end