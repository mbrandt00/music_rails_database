require 'rails_helper'

RSpec.describe 'Show page' do
  let!(:chopin) {Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')}
  let!(:adams) {Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')}
  describe 'As a visitor' do
    it 'can show composer information' do #1
      visit "/composers/#{chopin.id}"
      expect(page).to have_content(chopin.name)
      expect(page).to have_content(chopin.birth_year)
      expect(page).to have_content(chopin.ethnicity)
      expect(page).to_not have_content(adams.name)
    end
    it 'I can edit composer information' do #12
      visit "/composers/#{adams.id}"
      click_link "Edit Composer"
      expect(current_path).to eq("/composers/#{adams.id}/edit")
      fill_in 'num_compositions', with: '85'
      click_on 'Save Changes'
      expect(current_path).to eq("/composers/#{adams.id}")
      expect(page).to have_content('85')
    end
    it 'will have a count of the pieces associated with composer' do #7
      piece_1 = chopin.pieces.create!(opus: 47, number: nil, type_of_piece: "Ballad", composition_date: 1841, multiple_instruments: false, main_instrument: "piano", key_signature: "A-flat major")
      piece_2 = chopin.pieces.create!(opus: 21, number: nil, type_of_piece: "Concerto", composition_date: 1830, multiple_instruments: true, main_instrument: "piano", key_signature: "F minor")
      piece_3 = chopin.pieces.create!(opus: 10, number: 3, type_of_piece: "Etude", composition_date: 1833, multiple_instruments: false, main_instrument: "piano", key_signature: "E major", nickname:'Tristesse')
      piece_4 = adams.pieces.create!(opus: 12, number: 3, type_of_piece: "Sonata", composition_date: 1954, multiple_instruments: false, main_instrument: "piano", key_signature: "E major")
      visit "composers/#{chopin.id}"
      expect(page).to have_content("3 pieces by this composer in the database")
    end
    it 'will have a link that will delete the composer' do #19
      piece = adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano', )
      visit "composers/#{adams.id}"
      click_button "Delete Composer"
      expect(current_path).to eq("/composers")
      expect(page).to_not have_content(adams.name)
    end
  end
end
