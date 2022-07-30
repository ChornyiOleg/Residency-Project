class ResidencesController < ApplicationController
  before_action :authenticate_user!
  before_action :private_location, only: [:show]

  def index
    @residence = Residence.all
    @pagy, @residence = pagy(Residence.order(created_at: :desc), items: 6)
  end

  def show
    @residence = Residence.find(params[:id])
    @like = current_user.likes.find_by(residence_id: params[:id]) if current_user.likes.where(residence_id: params[:id]).exists?
    unless current_user.views.where(residence_id: params[:id]).exists?
      @view = current_user.views.new(residence_id: params[:id])
      @view.save
    end
    @pros = @residence.pros.split('-/-')
    @views = current_user.views.last(3)
  end

  def search
    @id_residences = []
    @id_residences = Array.new
    Residence.translation_class.where('name ILIKE?', '%' + params[:q] + '%').all.each do |t|
      @id_residences.push t.residence_id
    end
    @residences = Residence.where(id: @id_residences).order('name')

    @id_programs = []
    @id_programs = Array.new
    Program.translation_class.where('name ILIKE?', '%' + params[:q] + '%').all.each do |t|
      @id_programs.push t.program_id
    end
    @programs = Program.where(id: @id_programs).order('name')

    @id_countries = []
    @id_countries = Array.new
    Country.translation_class.where('name ILIKE?', '%' + params[:q] + '%').all.each do |t|
      @id_countries.push t.country_id
    end
    @countries = Country.where(id: @id_countries).order('name')
  end

  private

  def private_location
    @residence = Residence.find(params[:id])
    @latitude = @residence.latitude + rand(-0.003..0.003)
    @longitude = @residence.longitude + rand(-0.003..0.003)
  end
end
