require 'rails_helper'

RSpec.describe "Pieces show page", type: :feature do
  describe 'Editing piece' do
    it 'will allow for pieces to be edited' do
    chopin = Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')

    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
    visit "pieces/#{piece_1.id}"
    click_link "Edit Piece"
    expect(current_path).to eq("/pieces/#{piece_1.id}/edit")
    # save_and_open_page
    fill_in('opus', with: 3)
    click_on 'Save Changes'
    expect(current_path).to eq("/pieces/#{piece_1.id}")
    expect(page).to have_content('1')
    end
  end
end
