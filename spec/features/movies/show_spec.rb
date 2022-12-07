require 'rails_helper'
require 'test_helper'

RSpec.describe "Movie Show" do
  describe "User Story 4" do
    describe "User visits '/movies/:id'" do
      it "shows that movie and its attributes" do
        seed_kubrick

        visit "/movies/#{@movie_1.id}"

        expect(page).to have_content("#{@movie_1.title}")
        expect(page).to have_content("Runtime: #{@movie_1.runtime}")
        expect(page).to have_content("Year Released: #{@movie_1.release}")
        expect(page).to have_content("Like: #{@movie_1.like}")
        expect(page).to have_content("Domestic Gross: #{@movie_1.dmst_gross}")
        expect(page).to have_content("International Gross: #{@movie_1.intl_gross}")
      end
    end
  end
end