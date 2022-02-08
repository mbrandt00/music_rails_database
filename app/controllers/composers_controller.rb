class ComposersController < ApplicationController
  def index
    @composers = Composer.all.order(created_at: :desc)
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def compositions
    binding.pry
    @composer = Composer.find(params[:composer_id])
    @compositions = Piece.index_display(sanitize(params[:search]))
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
  def sanitize(search)
    search.to_i.to_s
  end
end
