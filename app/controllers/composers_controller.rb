class ComposersController < ApplicationController
  def index
    @composers = Composer.all.order(created_at: :desc)
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def compositions
    @composer = Composer.find(params[:composer_id])
    @compositions = params[:sort].present? ? @composer.pieces : @composer.pieces.order(params[:sort])
    @types = @compositions.all.map(&:type_of_piece).uniq
    @compositions = params[:filter].present? ? filter(@compositions) : @compositions.all
    # @compositions = @compositions.order(params[:sort]) if params[:sort]
  end



  def filter(relation)
    a = params.fetch(:filter,{})
    pieces = relation.where(type_of_piece: a[:pieces]) if a[:pieces].present?
    pieces = pieces.where("composition_date > ?", a[:first_year]) if a[:first_year].present?
    pieces = relation.where("composition_date < ?", a[:last_year]) if a[:last_year].present?
    return pieces
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
  def piece_params
    params.permit(filter: [:pieces, :first_year, :last_year])
  end
end
