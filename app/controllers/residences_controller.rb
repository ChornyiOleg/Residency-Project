class ResidencesController < ApplicationController
  before_action :authenticate_user!
  before_action :private_location, only: [:show]

  def index
    @residence = Residence.all
    @pagy, @residence = pagy(Residence.order(created_at: :desc), items: 6)
  end

  def show
    @residence = Residence.find(params[:id])
    @like = Like.find_by(user: current_user, residence_id: params[:id]) if Like.where(user: current_user, residence_id: params[:id]).exists?
    unless View.where(user: current_user, residence_id: params[:id]).exists?
      @view = View.new(user: current_user, residence_id: params[:id])
      @view.save
    end
    @descriptions = @residence.description.split('-/-')
    @pros = @residence.pros.split('-/-')
    @views = View.where(user: current_user).last(3)
  end

  def search
    @residences = Residence.where('name ILIKE?', '%' + params[:q] + '%').order('name')
    @pagy, @records = pagy(@residences, items: 10)
  end

  private

  def private_location
    @residence = Residence.find(params[:id])
    @latitude = @residence.latitude + rand(-0.003..0.003)
    @longitude = @residence.longitude + rand(-0.003..0.003)
  end
end
