class CompositionsController < ApplicationController
  def index

    @composer = Composer.find(params[:composer_id])
    @compositions = Piece.filter_compositions(params)
  end
end
