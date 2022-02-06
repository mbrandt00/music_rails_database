require 'rails_helper'

 RSpec.describe Piano, type: :model do
   it {should belong_to :manufacturer}
 end
