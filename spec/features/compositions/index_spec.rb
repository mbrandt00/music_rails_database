require 'rails_helper'

RSpec.describe "Compositions Page", type: :feature do
  let!(:adams) {Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')}
  let!(:chopin) {Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')}
  it 'will show all the compositions associated with a composer' do #5
    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
    piece_2 = chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
    piece_3 = chopin.pieces.create!(opus: 10, number: 3, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "E major", nickname:'Tristesse')
    piece_4 = adams.pieces.create!(opus: 12, number: 3, type_of_piece: "Sonata", composition_date: 1954, multiple_instruments: false, main_instrument: "piano", key_signature: "E major")
    visit "/composers/#{chopin.id}/index"
    expect(page).to have_content(piece_1.opus)
    expect(page).to have_content(piece_2.opus)
    expect(page).to have_content(piece_3.opus)
    expect(page).to_not have_content(piece_4.opus)
  end
  it 'will allow new pieces to be created' do #13
    piece = adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano')
    visit "/composers/#{adams.id}/index"
    click_link "New Piece"
    expect(current_path).to eq("/composers/#{adams.id}/index/new")
    fill_in 'opus', with: '85'
    fill_in 'composition_date', with: 2012
    fill_in 'key_signature', with: 'B-flat major'
    fill_in 'type_of_piece', with: 'Sonata'
    fill_in 'main_instrument', with: 'piano'
    click_on 'Create Piece'
    expect(current_path).to eq("/composers/#{adams.id}/index")
    expect(page).to have_content('B-flat major')
  end
  it 'has a link to edit each piece' do #17
    piece = adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano', )
    visit "/composers/#{adams.id}/index"
    click_link "Edit Piece"
    fill_in 'composition_date', with: 2014
    click_on 'Save Changes'

  end
  describe 'When i visit composer composition page I see to filter' do #16 #21
    it 'will sort pieces by date and piece type' do
      piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
      piece_3 = chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
      piece_4 = chopin.pieces.create!(opus: 10, number: 3, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "E major", nickname:'Tristesse')
      piece_5 = chopin.pieces.create!(opus: 10, number: 8, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "F major")
      piece_6 = chopin.pieces.create!(opus: 10, number: 12, type_of_piece: "Etude", composition_date: 1836, multiple_instruments: false, main_instrument: "piano", key_signature: "C minor", nickname:'Revolutionary')
      visit "/composers/#{chopin.id}/index"
      select "Etude", from: 'filter_pieces'
      select "1835", from: 'filter_first_year'
      select "1840", from: 'filter_last_year'
      click_button "Filter"
      expect(current_path).to eq("/composers/#{chopin.id}/index")
      expect(page).to have_content(piece_6.number)
      expect(page).to_not have_content(piece_4.nickname)
    end
  end
  it 'can delete pieces from the the composers pieces index page' do #23
    piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
    piece_2 = chopin.pieces.create!(opus: 35, number: nil, type_of_piece: "Sonata", composition_date: 1840, multiple_instruments: false, main_instrument: "piano", key_signature: "B-flat minor", nickname: 'Funeral March')
    visit "/composers/#{chopin.id}/index"
    first('.delete').click
    expect(current_path).to eq("/composers/#{chopin.id}/index")
    save_and_open_page
    expect(page).to have_content(piece_2.opus)
  end
end
