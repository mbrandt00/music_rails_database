require 'rails_helper'

 RSpec.describe 'manufacturers index page' do
   it "can see all manufacturers by name" do
     steinway = Manufacturer.create!(maker: "Steinway & Sons", location: "Manhattan, USA", year_opened: "1853", family_owned: true)
     bechstein = Manufacturer.create!(maker: "C. Bechstein", location: "Berlin, Germany", year_opened: "1853", family_owned: true)
     yamaha = Manufacturer.create!(maker: "Yamaha", location: "Hamamatsu, Japan", year_opened: "1887", family_owned: false)
     nord = Manufacturer.create!(maker: "Nord", location: "Stockholm, Sweden", year_opened: "1983", family_owned: false)

     visit "/manufacturers/#{manufacturer.id}"
     # save_and_open_page
     expect(page).to have_content(steinway.maker)
     expect(page).to have_content(bechstein.maker)
     expect(page).to have_content(yamaha.maker)
     expect(page).to have_content(nord.maker)
   end

 end
