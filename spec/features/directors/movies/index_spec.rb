require 'rails_helper'
require 'test_helper'

RSpec.describe "Director Movies Index" do
  before :each do
    seed_kubrick
    seed_pta
  end

  describe "User Story 5" do
    describe "User visits '/directors/:id/movies'" do
      it "shows a director's movies and their attributes" do
        visit "/directors/#{@director_1.id}/movies"

        expect(page).to have_content("#{@director_1.firstname} #{@director_1.lastname}")

        attributes = [:title, :runtime, :release, :like, :dmst_gross, :intl_gross]
        attributes.each do |att|
          expect(page).to have_content(@movie_1[att])
        end

        visit "/directors/#{@director_2.id}/movies"

        expect(page).to have_content("#{@director_2.firstname} #{@director_2.lastname}")

        attributes.each do |att|
          expect(page).to have_content(@movie_2[att])
        end
      end
    end
  end

  describe "User Story 21" do
    it 'adds a form that takes a minimum runtime threshold' do
      visit "/directors/#{@director_1.id}/movies"
      fill_in(:threshold, with: 150)
      click_button "Show!"

      expect(page).to have_content("Eyes Wide Shut")
      expect(page).to_not have_content("2001: A Space Odyssey")
    end
  end
end