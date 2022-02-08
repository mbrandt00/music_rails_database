require 'rails_helper'

RSpec.describe "Pieces index page", type: :feature do
  let!(:chopin) {Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')}
  let!(:adams) {Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')}
  let!(:tchaikovsky) {Composer.create!(name: "Tchaikovsky", birth_year: 1840, death_year: 1893, musical_era: "Romantic", num_compositions: 632, tonal: true, ethnicity: 'Russian')}

  it 'will display all pieces and attributes' do #3
    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: true, main_instrument: "piano", key_signature: "A-flat major")
    piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
    piece_3 = tchaikovsky.pieces.create!(opus: 49, number: nil, type_of_piece: "Overture", composition_date: 1880, multiple_instruments: true, main_instrument: "cannons", key_signature: "E-flat major", nickname: '1812 Overture')
    visit '/pieces'
    expect(page).to have_content(piece_1.opus)
    expect(page).to have_content(piece_1.type_of_piece)
    expect(page).to have_content(piece_3.nickname)
    expect(page).to have_content(piece_3.type_of_piece)
  end

  it 'will only show pieces that have multiple instruments' do #15
    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: true, main_instrument: "piano", key_signature: "A-flat major")
    piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
    piece_3 = tchaikovsky.pieces.create!(opus: 49, number: nil, type_of_piece: "Overture", composition_date: 1880, multiple_instruments: true, main_instrument: "cannons", key_signature: "E-flat major", nickname: '1812 Overture')
    visit '/pieces'
    expect(page).to have_content(piece_1.opus)
    expect(page).to have_content(piece_1.type_of_piece)
    expect(page).to have_content(piece_3.nickname)
    expect(page).to have_content(piece_3.type_of_piece)
    expect(page).to_not have_content(piece_2.opus)
  end

  it 'will allow for a piece to be edited from the index page' do
    piece_1 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: true, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
    visit "/pieces"
    click_link("Edit Piece")
    expect(current_path).to eq("/pieces/#{piece_1.id}/edit")
    fill_in('opus', with: 3)
    click_on 'Save Changes'
    expect(current_path).to eq("/pieces/#{piece_1.id}")
    expect(page).to have_content('3')
  end
end
