require 'rails_helper'

RSpec.describe "Allow new pieces to be made from a composer's pieces page", type: :feature do
  xit 'will allow new pieces to be created' do
    adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
    piece = adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano', )
    visit "/composers/#{adams.id}/pieces"
    click_link "New Piece"
    expect(current_path).to eq("/composers/#{adams.id}/pieces/new")
    fill_in 'opus', with: '85'
    fill_in 'composition_date', with: 2012
    fill_in 'key_signature', with: 'B-flat major'
    fill_in 'type_of_piece', with: 'Sonata'
    fill_in 'main_instrument', with: 'piano'
    click_on 'Create Piece'

    expect(current_path).to eq("/composers/#{adams.id}/pieces")
    expect(page).to have_content('B-flat major')
  end
  it 'has a link to edit each piece' do
    adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
    piece = adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano', )
    visit "/composers/#{adams.id}/pieces"
    click_link "Edit Piece"
    fill_in 'composition_date', with: 2014
    click_on 'Save Changes'
    expect(current_path).to eq("/pieces/#{piece.id}")
    expect(page).to have_content(2014)
  end
  describe 'When i visit composer composition page I see form for numeric input' do
    it 'will allow for only pieces to be returned that match a condition' do
      chopin = Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')
      chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
      chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
      chopin.pieces.create!(opus: 10, number: 3, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "E major", nickname:'Tristesse')
      chopin.pieces.create!(opus: 10, number: 8, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "F major")
      chopin.pieces.create!(opus: 10, number: 12, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "C minor", nickname:'Revolutionary')
      visit "/composers/#{chopin.id}/pieces"

    end
  end
end
