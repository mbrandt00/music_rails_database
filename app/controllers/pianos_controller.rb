class PianosController < ApplicationController
  def index
    @pianos = Piano.all
  end
end
