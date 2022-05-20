class ProgramsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = Program.all
    @pagy, @records = pagy(@programs, items: 10)
  end

  def show
    @program = Program.find(params[:id])
    @residences = @program.residences
    @pagy, @records = pagy(@residences, items: 10)
  end

end