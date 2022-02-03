require 'rails_helper'

RSpec.describe 'Edit Composer' do
  describe 'As a visitor' do
    describe 'When I visit composer page' do
      it 'I can edit composer information' do
        adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, dead: false, ethnicity: 'American')

        visit '/composers'
        click_link 'Edit Composer'
        expect(current_path).to eq("/composers/#{adams.id}/edit")
        fill_in 'num_compositions', with: '85'
        click_on 'Update Composer'

        expect(current_path).to eq('/composers')
        expect(page).to have_content('85')
      end
    end
  end
end
