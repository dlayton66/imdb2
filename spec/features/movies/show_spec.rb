require 'rails_helper'

RSpec.describe "Movies Index" do
  describe "User Story 3" do
    describe "User visits '/movies'" do
      it "shows all movies and their attributes" do
        director_1 = Director.create!(firstname: "Stanley",
          lastname: "Kubrick",
          alive: false,
          age: 70)
        
        movie_1 = director_1.movies.create!(title: "Eyes Wide Shut",
                                            runtime: 159,
                                            release: '1999-07-16',
                                            like: true,
                                            dmst_gross: 55691208,
                                            intl_gross: 106551476)

        visit "/movies/#{movie_1.id}"

        expect(page).to have_content("#{movie_1.title}")
        expect(page).to have_content("Runtime: #{movie_1.runtime}")
        expect(page).to have_content("Year Released: #{movie_1.release}")
        expect(page).to have_content("Like: #{movie_1.like}")
        expect(page).to have_content("Domestic Gross: #{movie_1.dmst_gross}")
        expect(page).to have_content("International Gross: #{movie_1.intl_gross}")
      end
    end
  end
end