class ResidencesController < ApplicationController
  before_action :authenticate_user!

  def index
    @residence = Residence.all
    @pagy, @residence = pagy(Residence.order(created_at: :desc), items: 8)
  end

  def show
    @residence = Residence.find(params[:id])
    @like = Like.find_by(user: current_user, residence_id: params[:id]) if Like.where(user: current_user, residence_id: params[:id]).exists?
    if !View.where(user: current_user, residence_id: params[:id]).exists?
      @view = View.new(user: current_user, residence_id: params[:id])
      @view.save
    end
    @views = View.where(user: current_user).last(5)
  end

  def search
    @residences = Residence.where('name LIKE?', "%" + params[:q] + "%").order('name')
    @pagy, @records = pagy(@residences, items: 10)
  end

end