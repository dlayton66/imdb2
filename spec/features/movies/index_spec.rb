require 'rails_helper'
require 'test_helper'

RSpec.describe "Movies Index" do
  describe "User Story 3" do
    describe "User visits '/movies'" do
      it "shows all movies and their attributes" do
        seed_kubrick
        seed_pta

        visit "/movies"

        expect(page).to have_content("#{@movie_1.title}")
        expect(page).to have_content("Runtime: #{@movie_1.runtime}")
        expect(page).to have_content("Year Released: #{@movie_1.release}")
        expect(page).to have_content("Like: #{@movie_1.like}")
        expect(page).to have_content("Domestic Gross: #{@movie_1.dmst_gross}")
        expect(page).to have_content("International Gross: #{@movie_1.intl_gross}")

        expect(page).to have_content("#{@movie_2.title}")
        expect(page).to have_content("Runtime: #{@movie_2.runtime}")
        expect(page).to have_content("Year Released: #{@movie_2.release}")
        expect(page).to have_content("Like: #{@movie_2.like}")
        expect(page).to have_content("Domestic Gross: #{@movie_2.dmst_gross}")
        expect(page).to have_content("International Gross: #{@movie_2.intl_gross}")
      end
    end
  end
end