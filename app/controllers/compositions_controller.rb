class CompositionsController < ApplicationController
  def index
    @composer = Composer.find(params[:composer_id])
    @compositions = Piece.filter_compositions(params)
  end

  def new
    @composer = Composer.find(params[:id])
  end

  def create
    composer = Composer.find(params[:id])
    piece = composer.pieces.create(create_params)
    redirect_to "/composers/#{composer.id}/index"
  end

  def destroy
    Piece.destroy(params[:id])
    redirect_to "/composers/#{params[:composer_id]}/show"
  end

  private
  def create_params
    params.permit(:opus, :number, :type_of_piece, :nickname, :composition_date, :multiple_instruments, :main_instrument, :key_signature)
  end
end
