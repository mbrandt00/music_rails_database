class Piece < ApplicationRecord
  belongs_to :composer

  def age_at_time_of_composition
    composition_date - composer.birth_year
  end
end
