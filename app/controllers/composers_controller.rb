class ComposersController < ApplicationController
  def index
    @composers = Composer.all.order(created_at: :desc)
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def compositions
    @own_works = Composer.find(params[:composer_id]).pieces
  end

  def create
    binding.pry
    Composer.create(composer_params)
    redirect_to '/composers'
  end

  private
  def composer_params
    params.permit(:name, :birth_year, :death_year, :musical_era, :ethnicity,
    :num_compositions)
  end
end
