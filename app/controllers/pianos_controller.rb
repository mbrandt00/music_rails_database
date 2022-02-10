class PianosController < ApplicationController
  def index
    @pianos = Piano.acoustic
  end

  def show
    @piano = Piano.find(params[:id])
  end

  def edit
    @piano = Piano.find(params[:id])
  end

  def update
    piano = Piano.find(params[:id])
    piano.update(piano_params[:piano])
    piano.save
    redirect_to "/pianos/#{piano.id}"
  end

  def destroy
    Piano.destroy(params[:id])
    redirect_to '/pianos'
  end

  private
  def piano_params # only needed when creating / updating
    params.permit(piano: [:model, :style, :price, :color, :acoustic])
  end


end
