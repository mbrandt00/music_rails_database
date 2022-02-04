class Composer < ApplicationRecord
  has_many :pieces

  def alive?
    !death_year
  end
end
