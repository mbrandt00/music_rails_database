class Piano < ApplicationRecord
  belongs_to :manufacturer

  def self.acoustic
    where("acoustic = true")
  end

end
