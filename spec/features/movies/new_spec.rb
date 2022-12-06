require 'rails_helper'

# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe "Create Movie" do
  before :each do
    seed_kubrick
  end

  describe "User Story 13" do
    it 'has a link to Create Movie on director movies page' do
      visit "/directors/#{@director_1.id}/movies"

      click_on "Create Movie"

      expect(current_path).to eq("/directors/#{@director_1.id}/movies/new")
    end

    it 'can create a new movie' do
      visit "/directors/#{@director_1.id}/movies/new"

      fill_in(:title, with: "The Shining")
      fill_in(:runtime, with: 146)
      fill_in(:release, with: '1980-05-23')
      fill_in(:like, with: true)
      fill_in(:dmst_gross, with: 45_634_352)
      fill_in(:intl_gross, with: 1_701_452)
      click_button('Create Movie')

      expect(current_path).to eq("/directors/#{@director_1.id}/movies")

      visit("/directors/#{@director_1.id}/movies")
      
      expect(page).to have_content("The Shining")
    end
  end
end