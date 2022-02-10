require 'rails_helper'

 RSpec.describe "show page" do

   let!(:steinway) {Manufacturer.create!(maker: "Steinway & Sons", location: "Manhattan, USA", year_opened: "1853", family_owned: true, ceo: "Ron Losby")}
   let!(:bechstein) {Manufacturer.create!(maker: "C. Bechstein", location: "Berlin, Germany", year_opened: "1853", family_owned: true, ceo: "Stefan Freymuth")}
   let!(:yamaha) {Manufacturer.create!(maker: "Yamaha", location: "Hamamatsu, Japan", year_opened: "1887", family_owned: false, ceo: "Yoshihiro Hidaka")}
   let!(:nord) {Manufacturer.create!(maker: "Nord", location: "Stockholm, Sweden", year_opened: "1983", family_owned: true, ceo: "Hans Nordelius")}
   let!(:piano_1) {steinway.pianos.create!(model: "Model D", style: "Concert Grand", price: 150000, color: "black", acoustic: true)} #length: "8ft 11in")
   let!(:piano_2) {steinway.pianos.create!(model: "Model B", style: "Concert Grand", price: 101700, color: "black", acoustic: true)} #length: "6ft 10in")
   let!(:piano_3) {steinway.pianos.create!(model: "Model A", style: "Concert Grand", price: 85000, color: "black", acoustic: true)} #length: "6ft 2in")
   let!(:piano_4) {steinway.pianos.create!(model: "Model O", style: "Concert Grand", price: 70000, color: "black", acoustic: true)} #length: "5ft 10in")

   # before(:each) do
   #   steinway.maker
   # end
   it "can display Manufacturer with attributes" do

     visit "/manufacturers/#{steinway.id}"
     expect(page).to have_content(steinway.maker)
   end

   it "can display individual pianos associated with the manufacturer and its attributes" do # User story 5

     visit "/manufacturers/#{steinway.id}/pianos"
     expect(page).to have_content(steinway.maker)
   end

   it "can display a count of the number of pianos associated with the specific manufacturer" do

     visit "/manufacturers/#{steinway.id}/pianos"
     expect(page).to have_content("This Manufacturer Has 4 Pianos")
   end

   it 'can update a manufacturers attributes' do # User story 12
     visit "/manufacturers/#{yamaha.id}"
     click_link "Edit Manufacturer"
     expect(current_path).to eq("/manufacturers/#{yamaha.id}/edit")
     fill_in 'maker', with: "Mike Dao"
     fill_in 'location', with: "Colorado, USA"
     fill_in 'year_opened', with: 1980
     click_on 'Save Changes'
     expect(current_path).to eq("/manufacturers/#{yamaha.id}")
     expect(page).to have_content('Mike Dao')
   end

 end
