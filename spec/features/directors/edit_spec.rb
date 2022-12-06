require 'rails_helper'
require 'test_helper'

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

RSpec.describe "Director Update" do
  describe "User Story 12" do
    describe "User visits '/directors/:id'" do
      it 'has a link to update the director' do
        seed_kubrick
        visit "/directors/#{@director_1.id}"

        click_on "Edit Director"

        expect(current_path).to eq("/directors/#{@director_1.id}/edit")
      end
    end

    describe "User is redirected to '/directors/:id/edit" do
      it 'allows the user to edit a director' do
        director = Director.create!(
          firstname: 'Paul Thomas',
          lastname: 'Blanderson',
          age: 52,
          alive: true
        )
        visit '/directors'

        expect(page).to have_content('Paul Thomas Blanderson')

        visit "/directors/#{director.id}"

        click_on "Edit Director"

        fill_in(:lastname, with: 'Anderson')

        click_button "Update Director"

        expect(current_path).to eq("/directors")
        expect(page).to have_content('Paul Thomas Anderson')
      end
    end
  end
end