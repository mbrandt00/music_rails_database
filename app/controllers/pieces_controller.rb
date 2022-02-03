class PiecesController < ApplicationController
  def index
    @pieces = Piece.all.order(:type_of_piece, :opus, number: :asc)
  end

  def show
    @piece = Piece.find(params[:id])
    @age_at_time_of_composition = @piece.age_at_time_of_composition
  end
end
