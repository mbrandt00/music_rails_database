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
  end

  private
  def piece_params
    params.permit(:opus, :number, :type_of_piece, :nickname, :composition_date, :multiple_instruments, :main_instrument, :key_signature)
  end


end
