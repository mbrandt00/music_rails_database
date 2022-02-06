class Composer < ApplicationRecord
  has_many :pieces, dependent: :destroy

  def alive?
    !death_year
  end

  def first_piece_year
    pieces.order(:composition_date).first[:composition_date]
  end

  def last_piece_year
    pieces.order(composition_date: :desc).first[:composition_date]
  end

  # def params_filter
  #   binding.pry
  # end


end
