class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_countries
  before_action :set_programs
  def index

  end

  def set_countries
    @countries = Country.all
  end

  def set_programs
    @programs = Program.all
  end
end
