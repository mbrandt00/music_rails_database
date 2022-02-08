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

  def filter(relation)
    a = params.fetch(:filter,{})
    pieces = relation.where(type_of_piece: a[:pieces]) if a[:pieces].present?
    pieces = pieces.where("composition_date > ?", a[:first_year]) if a[:first_year].present?
    pieces = relation.where("composition_date < ?", a[:last_year]) if a[:last_year].present?
    return pieces
  end

end
