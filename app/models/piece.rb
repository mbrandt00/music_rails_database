class Piece < ApplicationRecord
  belongs_to :composer

  def age_at_time_of_composition
    composition_date - composer.birth_year
  end

  def piano
    if multiple_instruments
      'Piano + Orchestra'
    else
      'Solo Piano Piece'
    end
  end

  def self.ordered
    all.order(:type_of_piece, :opus, number: :asc)
  end

  def self.multiple_instruments
    where("multiple_instruments = true")
  end

  def self.sort_compositions
    binding.pry
    order(params[:sort])
  end
end
