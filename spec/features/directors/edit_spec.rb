require 'rails_helper'
require 'test_helper'

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