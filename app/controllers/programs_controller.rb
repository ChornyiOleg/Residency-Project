class ProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program, only: [:edit, :update, :show, :destroy]

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

  # GET /posts/new
  def new
    @program = Program.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @program = Program.new(program_params)
    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: "Program was successfully created." }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: "Program was successfully updated." }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: "Program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_program
    @program = Program.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def program_params
    params.require(:program).permit(:name, :content, :image)
  end
end
