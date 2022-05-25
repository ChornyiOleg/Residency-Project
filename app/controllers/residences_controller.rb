class ResidencesController < ApplicationController
  before_action :authenticate_user!

  def show
    @residence = Residence.find(params[:id])
  end

  def search
    @residences = Residence.where('name LIKE?', "%" + params[:q] + "%").order('name')
    @pagy, @records = pagy(@residences, items: 10)
  end

end