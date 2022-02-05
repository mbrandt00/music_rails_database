require 'rails_helper'

RSpec.describe 'New Composer' do
  describe 'As a visitor' do
    describe 'When I visit the new composer form by clicking a link on the index' do
      xit 'can create a new composer' do
        visit '/composers'
        click_link 'New Composer'
        expect(current_path).to eq('/composers/new')
      end
    end
    describe 'When I visit the composer index page, next to each composer is a link to edit parents info. When I click the link, I can edit the info' do
      it 'can edit a composer with a button click' do
        adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
        visit '/composers/'
        click_link "Edit Composer"
        expect(current_path).to eq("/composers/#{adams.id}/edit")
        fill_in 'num_compositions', with: '85'
        click_on 'Save Changes'

        expect(current_path).to eq("/composers/#{adams.id}")
        expect(page).to have_content('85')
      end
    end
  end
end
