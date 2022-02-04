require 'rails_helper'

RSpec.describe "Allow new pieces to be made from a composer's pieces page", type: :feature do
  it 'will allow new pieces to be created' do
    adams = Composer.create!(name: 'John Adams', birth_year: 1947, musical_era: "Modern", num_compositions: 80, tonal: false, ethnicity: 'American')
    adams.pieces.create!(opus: 10, composition_date: 2000, key_signature: 'C major', type_of_piece: 'Bagtelle', multiple_instruments: false, main_instrument: 'piano', )
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
end
