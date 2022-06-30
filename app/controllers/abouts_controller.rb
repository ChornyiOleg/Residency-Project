class AboutsController < ApplicationController
  def new
    @about = About.new
  end

  def index
    @abouts = About.all

  end

  def create
    @about = About.new(params[:about].permit(:title, :subtitle, :image, :advantages, :benefits))

    if @about.save
      redirect_to @about
    else
      render 'new'
    end
  end

  def show
    @about = About.find(params[:id])
  end

  def edit
    @about = About.find(params[:id])
  end

  def update
    @about = About.find(params[:id])

    if @about.update(params[:about].permit(:title, :subtitle, :image, :advantages, :benefits))
      redirect_to @about
    else
      render 'edit'
    end
  end

  def destroy
    @about = About.find(params[:id])
    @about.destroy

    redirect_to abouts_path
  end


  private
  def abouts_path
    params.require(:about).permit(:title, :subtitle, :image, :advantages, :benefits)
  end

end
