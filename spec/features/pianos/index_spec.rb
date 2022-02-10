require 'rails_helper'

 RSpec.describe 'Pianos index page' do

   it "can display pianos and its attributes" do
     steinway = Manufacturer.create!(maker: "Steinway & Sons", location: "Manhattan, USA", year_opened: "1853", family_owned: true, ceo: "Ron Losby")
     piano_1 = steinway.pianos.create!(model: "Model D", style: "Concert Grand", price: 150000, color: "black", acoustic: true) #length: "8ft 11in")
     piano_2 = steinway.pianos.create!(model: "Model B", style: "Concert Grand", price: 101700, color: "black", acoustic: true) #length: "6ft 10in")
     piano_3 = steinway.pianos.create!(model: "Model A", style: "Concert Grand", price: 85000, color: "black", acoustic: true) #length: "6ft 2in")
     piano_4 = steinway.pianos.create!(model: "Model O", style: "Concert Grand", price: 70000, color: "black", acoustic: true) #length: "5ft 10in")

     visit '/pianos'
     # save_and_open_page
     expect(page).to have_content(piano_1.model)
     expect(page).to have_content(piano_2.model)
     expect(page).to have_content(piano_3.model)
     expect(page).to have_content(piano_4.model)
   end

   xit 'can display a link to add new piano in the manufacturers pianos index page' do # User story 13
     steinway = Manufacturer.create!(maker: "Steinway & Sons", location: "Manhattan, USA", year_opened: "1853", family_owned: true, ceo: "Ron Losby")
     piano_1 = steinway.pianos.create!(model: "Model D", style: "Concert Grand", price: 150000, color: "black", acoustic: true) #length: "8ft 11in")
     piano_2 = steinway.pianos.create!(model: "Model B", style: "Concert Grand", price: 101700, color: "black", acoustic: true) #length: "6ft 10in")
     piano_3 = steinway.pianos.create!(model: "Model A", style: "Concert Grand", price: 85000, color: "black", acoustic: true) #length: "6ft 2in")
     piano_4 = steinway.pianos.create!(model: "Model O", style: "Concert Grand", price: 70000, color: "black", acoustic: true) #length: "5ft 10in")
     visit "/manufacturers/#{steinway.id}/index"
     # save_and_open_page
     click_link("Create Piano")
     expect(current_path).to eq("/manufacturers/#{steinway.id}/index/new")
     fill_in 'model', with: 'Model M'
     fill_in 'style', with: 'Concert Grand'
     fill_in 'price', with: 65000
     fill_in 'color', with: 'Black'
     fill_in 'acoustic', with: true
     click_on 'Create Piano'
     expect(current_path).to eq("/manufacturers/#{steinway.id}/index")
     expect(page).to have_content('Model M')
   end





 end
