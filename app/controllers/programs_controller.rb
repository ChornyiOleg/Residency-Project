class ProgramsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = Program.all
    @pagy, @records = pagy(@countries, items: 10)
    @pagy, @programs = pagy(Program.order(created_at: :desc), items: 6)
  end

  def show
    @program = Program.find(params[:id])
    @residences = @program.residences
    @pagy, @records = pagy(@programs, items: 10)
    @pagy, @records = pagy(@residences, items: 10)
  end

  def search
    @programs = Program.where('content ILIKE ? OR title ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
    @pagy, @records = pagy(@programs, items: 6)
    render :index
  end

  private

  def program_params
    params.require(:program).permit(:name, :content, :image)
  end
end
