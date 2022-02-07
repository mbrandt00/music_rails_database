require 'rails_helper'

 RSpec.describe 'pianos show page' do
   it "can display piano by id with its respective attributes" do # User story 4
     steinway = Manufacturer.create!(maker: "Steinway & Sons", location: "Manhattan, USA", year_opened: "1853", family_owned: true, ceo: "Ron Losby")
     bechstein = Manufacturer.create!(maker: "C. Bechstein", location: "Berlin, Germany", year_opened: "1853", family_owned: true, ceo: "Stefan Freymuth")
     nord = Manufacturer.create!(maker: "Nord", location: "Stockholm, Sweden", year_opened: "1983", family_owned: true, ceo: "Hans Nordelius")

     piano_1 = steinway.pianos.create!(model: "Model D", style: "Concert Grand", price: 150000, color: "black", acoustic: true) #length: "8ft 11in")
     piano_10 = nord.pianos.create!(model: "Stage 3", style: "Digital", price: 4700, color: "red", acoustic: false) #length: "1ft 4in"

     visit "/pianos/#{piano_1.id}"
     expect(page).to have_content(piano_1.model)
     expect(page).to have_content(piano_1.style)
     expect(page).to have_content(piano_1.price)
     expect(page).to have_content(piano_1.color)
     expect(page).to have_content(piano_1.acoustic)

     visit "/pianos/#{piano_10.id}"
     # save_and_open_page
     expect(page).to have_content(piano_10.model)
     expect(page).to have_content(piano_10.style)
     expect(page).to have_content(piano_10.price)
     expect(page).to have_content(piano_10.color)
     expect(page).to have_content(piano_10.acoustic)
   end

 end
