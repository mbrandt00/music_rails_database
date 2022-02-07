class Piece < ApplicationRecord
  belongs_to :composer

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


end
