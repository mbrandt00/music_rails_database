class ComposersController < ApplicationController
  def index
    @composers = Composer.all.order(created_at: :desc)
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def create
    Composer.create(composer_params)
    redirect_to '/composers'
  end

  def edit
    @composer = Composer.find(params[:id])
  end

  def update
    composer = Composer.find(params[:id])
    composer.update(composer_params)
    composer.save
    redirect_to "/composers/#{composer.id}"
  end

  def destroy
    Composer.destroy(params[:id])
    redirect_to '/composers'
  end


  private
  def composer_params
    params.permit(:name, :birth_year, :death_year, :musical_era, :ethnicity,
    :num_compositions)
  end

end
