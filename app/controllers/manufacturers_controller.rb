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

  def method_name

  end
end
