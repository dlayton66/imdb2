require 'rails_helper'
require 'test_helper'

RSpec.describe "Movie Update" do
  describe "User Story 14" do
    it 'has a link to update movie on its show page' do
      seed_kubrick

      visit "/movies/#{@movie_1.id}"

      click_on "Edit Movie"

      expect(current_path).to eq("/movies/#{@movie_1.id}/edit")
    end
  end
end