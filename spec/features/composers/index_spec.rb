require 'rails_helper'

RSpec.describe 'New Composer' do
  describe 'As a visitor' do
    describe 'When I visit the new composer form by clicking a link on the index' do
      it 'can create a new composer' do
        visit '/composers'
        click_link 'New Composer'
        expect(current_path).to eq('/composers/new')
      end
    end
  end
end
