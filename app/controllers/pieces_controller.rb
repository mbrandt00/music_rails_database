class PiecesController < ApplicationController
  def index
    @pieces = Piece.ordered
  end

  def show
    @piece = Piece.find(params[:id])
  end
end
