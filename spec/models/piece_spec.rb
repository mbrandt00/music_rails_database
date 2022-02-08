require 'rails_helper'


RSpec.describe Piece, type: :model do
  it {should belong_to :composer}
  describe 'age_at_time_of_composition' do
    it 'will return the age of a composer at the time of composition' do
      chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true)
      piece = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      expect(piece.age_at_time_of_composition).to eq(31)
    end
  end
  describe 'return if piece has multiple instruments' do
    it '#piano' do
      chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true)
      piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: true, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
      expect(piece_1.piano).to eq('Solo Piano Piece')
      expect(piece_2.piano).to eq('Piano + Orchestra')
    end
    it 'will active record search for multiple_instrument pieces' do
      chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true)
      piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: true, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
      a = Piece.multiple_instruments
      expect(a.first.opus).to eq(35)
    end
  end
  describe 'it will filter pieces' do
    it 'will sort pieces by date and piece type' do
      chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true)
      piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
      piece_3 = chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
      piece_4 = chopin.pieces.create!(opus: 10, number: 3, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "E major", nickname:'Tristesse')
      piece_5 = chopin.pieces.create!(opus: 10, number: 8, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "F major")
      piece_6 = chopin.pieces.create!(opus: 10, number: 12, type_of_piece: "Etude", composition_date: 1836, multiple_instruments: false, main_instrument: "piano", key_signature: "C minor", nickname:'Revolutionary')
      params = {composer_id: chopin.id, filter: {:first_year => 1834, :last_year => 1840, :pieces => ['Etude']}}
      filtered = Piece.filter_compositions(params)
      expect(filtered.count).to eq(1)
      expect(filtered.first.type_of_piece).to eq('Etude')
      expect(filtered.first.composition_date).to be < 1840
      expect(filtered.first.composition_date).to be >= 1836
    end
  end
  describe 'it will order pieces by type of piece then opus' do
    it '#self.ordered' do
      chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true)
      piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
      concerto_1 = chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
      concerto_2 = chopin.pieces.create!(opus: 22, type_of_piece: "Concerto", composition_date: 1836, multiple_instruments: false, main_instrument: "piano", key_signature: "C minor", nickname:'Revolutionary')
      expect(Piece.ordered.first).to eq(piece_1)
      expect(Piece.ordered.second).to eq(concerto_1)
    end
  end
end
