class PiecesController < ApplicationController
  def index
    @pieces = Piece.ordered
  end

  def show
    @piece = Piece.find(params[:id])
  end

  def create
    composer = Composer.find(params[:id])
    composer.pieces.create(piece_params)
    redirect_to "/composers/#{composer.id}/pieces"
  end

  def edit
    @piece = Piece.find(params[:id])
  end

  def update
    piece = Piece.find(params[:id])
    piece.update(piece_params[:piece])
    piece.save
    redirect_to "/pieces/#{piece.id}"
  end

  private

  def piece_params
    params.permit(piece: [:opus, :number, :type_of_piece, :nickname, :composition_date, :multiple_instruments, :main_instrument, :key_signature])
  end


end
