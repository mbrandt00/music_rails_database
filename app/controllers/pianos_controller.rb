class PianosController < ApplicationController
  def index
    @pianos = Piano.all
  end

  def show
    @piano = Piano.find(params[:id])    
  end
end
