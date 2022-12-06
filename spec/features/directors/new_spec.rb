require 'rails_helper'

RSpec.describe 'Create Director' do
  describe "User Story 11" do
    it "links to the create director page from Directors index" do
      visit "/directors"

      click_on 'Create Director'

      expect(current_path).to eq('/directors/new')
    end

    it "can create a new director" do
      visit "/directors/new"

      fill_in(:firstname, with: 'Ed')
      fill_in(:lastname, with: 'Wood')
      fill_in(:age, with: 54)
      fill_in(:alive, with: false)
      click_button('Create Director')

      expect(current_path).to eq("/directors")
      expect(page).to have_content("Ed Wood")
    end
  end

    
  
end