require 'rails_helper'

RSpec.describe 'Show page' do
  let!(:chopin) {Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')}
  let!(:adams) {Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')}
  describe 'As a visitor' do
    it 'can show composer information' do
      visit "/composers/#{chopin.id}"
      expect(page).to have_content(chopin.name)
      expect(page).to have_content(chopin.birth_year)
      expect(page).to have_content(chopin.ethnicity)
      expect(page).to_not have_content(adams.name)
    end

    end
    describe 'When I visit composer page' do
      it 'I can edit composer information' do #2
        visit "/composers/#{adams.id}"
        click_link "Edit Composer"
        expect(current_path).to eq("/composers/#{adams.id}/edit")
        fill_in 'num_compositions', with: '85'
        click_on 'Save Changes'
        expect(current_path).to eq("/composers/#{adams.id}")
        expect(page).to have_content('85')
      end
    describe "I can delete a composer from the show page" do
      it 'will have a link that will delete the composer' do
        piece = adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano', )
        visit "composers/#{adams.id}"
        click_button "Delete Composer"
        expect(current_path).to eq("/composers")
        expect(page).to_not have_content(adams.name)
      end
    end
  end
end
