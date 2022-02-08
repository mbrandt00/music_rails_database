require 'rails_helper'


RSpec.describe Composer, type: :model do
   it {should have_many :pieces}
   describe 'Alive' do
     it '#alive?' do
       adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
       chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true)
       expect(adams.alive?).to be true
       expect(chopin.alive?).to be false
     end
   end
   describe "first and last composition and types in database" do
     before(:each) do
       @chopin = Composer.create!(name: "Chopin", birth_year: 1810, death_year: 2000, musical_era: "Romantic", num_compositions: 210, tonal: true)
       @piece_1 = @chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
       @piece_2 = @chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
       @piece_3 = @chopin.pieces.create!(opus: 10, number: 3, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "E major", nickname:'Tristesse')
       @piece_4 = @chopin.pieces.create!(opus: 12, number: 3, type_of_piece: "Sonata", composition_date: 1954, multiple_instruments: false, main_instrument: "piano", key_signature: "E major")
     end
     it '#first_piece_year' do
       expect(@chopin.first_piece_year).to eq(1830)
     end
     it '#last_piece_year' do
       expect(@chopin.last_piece_year).to eq(1954)
     end
    it 'will return an array of types of pieces composer has written' do
      expect(@chopin.types_of_pieces).to eq(['Ballad', 'Concerto', 'Etude', 'Sonata'])
    end
  end
end
