require 'rails_helper'

 RSpec.describe "show page" do

   let!(:steinway) {Manufacturer.create!(maker: "Steinway & Sons", location: "Manhattan, USA", year_opened: "1853", family_owned: true, ceo: "Ron Losby")}
   let!(:bechstein) {Manufacturer.create!(maker: "C. Bechstein", location: "Berlin, Germany", year_opened: "1853", family_owned: true, ceo: "Stefan Freymuth")}
   let!(:yamaha) {Manufacturer.create!(maker: "Yamaha", location: "Hamamatsu, Japan", year_opened: "1887", family_owned: false, ceo: "Yoshihiro Hidaka")}
   let!(:nord) {Manufacturer.create!(maker: "Nord", location: "Stockholm, Sweden", year_opened: "1983", family_owned: true, ceo: "Hans Nordelius")}

   it "can display Manufacturer with attributes" do

     visit "/manufacturers/#{steinway.id}"
     expect(page).to have_content(steinway.id)
   end


 end
