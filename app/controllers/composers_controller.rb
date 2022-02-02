class ComposersController < ApplicationController
  def index
    @composers = Composer.all.order(:name)
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def compositions
    @own_works = Composer.find(params[:composer_id]).pieces
  end
end
