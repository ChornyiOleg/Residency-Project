class CountriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @countries = Country.all
    @pagy, @records = pagy(@countries, items: 10)
    @pagy, @countries = pagy(Country.order(created_at: :desc), items: 6)
  end

  def show
    @country = Country.find(params[:id])
    @residences = @country.residences
    @pagy, @records = pagy(@residences, items: 10)
  end

  private

  def country_params
    params.require(:country).permit(:name, :content, :image)
  end
end
