require 'rails_helper'


RSpec.describe Piece, type: :model do
  describe 'age_at_time_of_composition' do
    it 'will return the age of a composer at the time of composition' do
      chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, dead: true)
      piece = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      expect(piece.age_at_time_of_composition).to eq(31)
    end
  end
end
