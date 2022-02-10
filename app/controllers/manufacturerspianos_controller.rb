class ManufacturerspianosController < ApplicationController

def index
  binding.pry
  @manufacturers = Manufacturer.find(params[:id])
  @manufacturerspianos = @manufacturers.pianos
end

def create
  @manufacturers = Manufacturer.find(params[:id])
  @manufacturers.pianos.create(piano_params)
  redirect_to "/manufacturerspianos/#{@manufacturers.id}/index"
end

private
def piano_params
  params.permit(:model, :style, :price, :color, :acoustic)
end



end
