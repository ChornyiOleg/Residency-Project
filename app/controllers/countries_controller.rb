class CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_country, only: [:edit, :update, :show, :destroy]

  def index
    @countries = Country.all
    @pagy, @records = pagy(@countries, items: 10)
    @pagy, @countries = pagy(Country.order(created_at: :desc), items: 6)
  end

  def search
    @countries = Country.where('content ILIKE ? OR title ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
    @pagy, @records = pagy(@countries, items: 6)
    render :index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @country = Country.find(params[:id])
    @residences = @country.residences
    @pagy, @records = pagy(@residences, items: 10)
  end

  # GET /posts/new
  def new
    @country = Country.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @country = Country.new(country_params)
    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: "Country was successfully created." }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: "Country was successfully updated." }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: "Country was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_country
    @country = Country.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def country_params
    params.require(:country).permit(:name, :content, :image)
  end
end
