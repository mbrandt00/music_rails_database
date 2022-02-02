class ComposersController < ApplicationController
  def index
    @composers = Composer.all.order(:name)
  end

  def show
    @composer = Composer.find(params[:id])
  end
end
