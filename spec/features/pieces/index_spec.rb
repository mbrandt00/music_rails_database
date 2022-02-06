require 'rails_helper'

RSpec.describe "Pieces index page", type: :feature do
  it 'will display all pieces and attributes' do
    chopin = Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')
    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: true, main_instrument: "piano", key_signature: "A-flat major")
    piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
    visit '/pieces'
    expect(page).to have_content(piece_1.opus)
    end
  it 'will display the compositions of a single composer' do
    chopin = Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')
    tchaikovsky = Composer.create!(name: "Tchaikovsky", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')

    piece_1 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
    piece_2 = tchaikovsky.pieces.create!(opus: 2, number: nil, type_of_piece: "March", composition_date: 1830, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor")
    visit "/composers/#{chopin.id}/pieces"
    expect(page).to have_content(piece_1.opus)
    expect(page).to have_content(piece_1.nickname)
    expect(page).not_to have_content(piece_2.opus)
  end
end
