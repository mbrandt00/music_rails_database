class PiecesController < ApplicationController
  def index
    @pieces = Piece.ordered.multiple_instruments
  end

  def show
    @piece = Piece.find(params[:id])
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

  def destroy
    Piece.destroy(params[:id])
    redirect_to "/pieces"
  end
  private

  def piece_params
      params.permit(piece: [:opus, :number, :type_of_piece, :nickname, :composition_date, :multiple_instruments, :main_instrument, :key_signature])
    end

end
