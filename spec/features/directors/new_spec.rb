require 'rails_helper'

  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' 
  # where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.

  



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