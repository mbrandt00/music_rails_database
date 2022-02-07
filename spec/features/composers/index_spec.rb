require 'rails_helper'

RSpec.describe 'Index page' do
  let!(:chopin) {Composer.create!(name: "Frédéric François Chopin", birth_year: 1810, death_year: 1849, musical_era: "Romantic", num_compositions: 210, tonal: true, ethnicity: 'Polish')}
  let!(:adams) {Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')}

  describe 'As a visitor' do
    it 'will show all the composers on the page' do #1
      visit '/composers'
      expect(page).to have_content(chopin.name)
    end
    it 'can create a new composer' do
      visit '/composers'
      click_link 'New Composer'
      fill_in 'Name', with: "Michael Brandt"
      fill_in 'birth_year', with: 2000
      fill_in 'musical_era', with: 'modern'
      fill_in 'ethnicity', with: 'American'
      fill_in 'num_compositions', with: 1
      click_button 'Create Composer'
      expect(current_path).to eq('/composers')
      expect(page).to have_content('Michael Brandt')
    end
    describe 'When I visit the composer index page, next to each composer is a link to edit parents info. When I click the link, I can edit the info' do
      it 'can edit a composer with a button click' do
        adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
        visit '/composers/'
        click_link "Edit Composer"
        expect(current_path).to eq("/composers/#{adams.id}/edit")
        fill_in 'num_compositions', with: '85'
        click_button 'Save Changes'

        expect(current_path).to eq("/composers/#{adams.id}")
        expect(page).to have_content('85')
      end
    end
  end
end
