class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all.order(created_at: :desc)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def piano_list
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    Manufacturer.create(manufacturer_params)
    redirect_to '/manufacturers'
  end

  private
  def manufacturer_params
    params.permit(:maker, :location, :year_opened, :family_owned, :ceo)
  end

end
