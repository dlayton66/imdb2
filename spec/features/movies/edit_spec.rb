require 'rails_helper'
require 'test_helper'

RSpec.describe "Movie Update" do
  before :each do
    seed_kubrick
  end

  describe "User Story 14" do
    describe "User visits '/movies/:id'" do
      it 'has a link to update movie' do

        visit "/movies/#{@movie_1.id}"

        click_on "Edit Movie"

        expect(current_path).to eq("/movies/#{@movie_1.id}/edit")
      end
    end

    describe "User is redirected to '/movies/:id/edit'" do
      it 'allows the user to edit the movie' do
        movie = @director_1.movies.create!(
          title: "The Shinning",
          runtime: 146,
          release: '1980-05-23',
          like: true,
          dmst_gross: 45_634_352,
          intl_gross: 1_701_452
        )

        visit "/movies/#{movie.id}"

        expect(page).to have_content("The Shinning")

        click_on "Edit Movie"

        fill_in(:title, with: 'The Shining')

        click_button "Update Movie"

        expect(current_path).to eq("/movies/#{movie.id}")
        expect(page).to have_content("The Shining")
      end
    end
  end
end