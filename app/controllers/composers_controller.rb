class ComposersController < ApplicationController
  def index
    @composers = Composer.all
  end

  def info
    @composer = Composer.find(params[:id])
  end
end
