require 'rails_helper'

RSpec.describe 'Show page' do
  describe 'As a visitor' do
    describe 'When I visit composer page' do
      it 'I can edit composer information' do
        adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
        visit "/composers/#{adams.id}"
        click_link "Edit Composer"
        expect(current_path).to eq("/composers/#{adams.id}/edit")
        fill_in 'num_compositions', with: '85'
        click_on 'Save Changes'

        expect(current_path).to eq("/composers/#{adams.id}")
        expect(page).to have_content('85')
      end
    end
    describe "I can delete a composer from the show page" do
      it 'will have a link that will delete the composer' do
        adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
        piece = adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano', )
        visit "composers/#{adams.id}"
        click_button "Delete Composer"
        expect(current_path).to eq("/composers")
        expect(page).to_not have_content(adams.name)
      end
    end
  end
end
