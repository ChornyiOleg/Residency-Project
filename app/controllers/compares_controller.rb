class ComparesController < ApplicationController
  def index
    @compares = current_user.compares
    @pagy, @records = pagy(@compares, items: 10)
  end

  def create
    if in_progress?
      @compare = current_user.compares.find_by(residence_id: params[:residence_id])
      @compare.destroy
    else
      @compare = current_user.compares.new(residence_id: params[:residence_id])
      @compare.save
    end
    redirect_to @compare.residence
  end

  def destroy;
  end

  private

  def in_progress?
    current_user.compares.where(residence_id: params[:residence_id]).exists?
  end
end