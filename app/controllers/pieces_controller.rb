class PiecesController < ApplicationController
  def index
    @pieces = Piece.all.order(:type_of_piece, :opus, number: :asc)
  end

  def show
    @piece = Piece.find(params[:id])
  end
end
