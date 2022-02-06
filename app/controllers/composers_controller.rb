class ComposersController < ApplicationController
  def index
    @composers = Composer.all.order(created_at: :desc)
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def compositions

    @composer = Composer.find(params[:composer_id])
    @compositions = params[:sort].blank? ? @composer.pieces : @composer.pieces.order(params[:sort])
    @types = @compositions.all.map(&:type_of_piece).uniq
    binding.pry
    @compositions = params[:filter].present? ? @compositions.params_filter : @compositions.all
    binding.pry
  end

  def params_filter
    binding.pry
  end

  def create
    Composer.create(composer_params)
    redirect_to '/composers'
  end

  def create_composer_piece
    @composer = Composer.find(params[:id])
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
