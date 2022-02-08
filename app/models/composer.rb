class Composer < ApplicationRecord
  has_many :pieces, dependent: :destroy

  def alive?
    !death_year
  end

  def first_piece_year
    pieces.minimum(:composition_date)
  end

  def last_piece_year
    pieces.maximum('composition_date')
  end

  def types_of_pieces
    pieces.distinct.pluck(:type_of_piece)
  end

end
