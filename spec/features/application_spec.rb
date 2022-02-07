require 'rails_helper'

RSpec.describe 'Application' do
  it "should have the right links in navbar" do #8 and #9
    visit '/'
    within(".topnav") do
      expect(page).to have_content('Composers')
      expect(page).to have_content('Pieces')
      expect(page).to have_content('Manufacturers')
      expect(page).to have_content('Pianos')
    end
    visit '/composers' # for all pages
    within(".topnav") do
      expect(page).to have_content('Composers')
      expect(page).to have_content('Pieces')
      expect(page).to have_content('Manufacturers')
      expect(page).to have_content('Pianos')

    end
  end
end
