require 'rails_helper'

RSpec.describe "Pieces show page", type: :feature do
  let!(:chopin) {Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')}
  it 'will show the the information of a single page' do #4
    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
    visit "pieces/#{piece_1.id}"
    expect(page).to have_content(piece_1.opus)
    expect(page).to have_content(piece_1.type_of_piece)
    expect(page).to have_content(piece_1.composition_date)
    expect(page).to have_content(piece_1.key_signature)
  end
  describe 'Editing piece' do
    it 'will allow for pieces to be edited' do
    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
    visit "pieces/#{piece_1.id}"
    click_link "Edit Piece"
    expect(current_path).to eq("/pieces/#{piece_1.id}/edit")
    fill_in('opus', with: 3)
    click_on 'Save Changes'
    expect(current_path).to eq("/pieces/#{piece_1.id}")
    expect(page).to have_content('1')
    end
  end
  describe 'deleting piece' do
    it 'will allow a piece to be deleted while keeping the composer' do
      piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: true, main_instrument: "piano", key_signature: "A-flat major")
      piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
      visit "/pieces/#{piece_1.id}"
      click_button "Delete Piece"
      expect(current_path).to eq('/pieces')
      expect(page).to_not have_content('A-flat major')
      expect(page).to have_content('Funeral March')
    end
  end
end
