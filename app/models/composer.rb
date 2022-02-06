class Composer < ApplicationRecord
  has_many :pieces, :dependent => :destroy

  def alive?
    !death_year
  end
end
