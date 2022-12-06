require 'rails_helper'
require 'test_helper'

describe "User Story 20" do
  before :each do
    seed_kubrick
    seed_pta
  end

  it 'adds a link to delete movie from show page' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_link("Delete Movie")

    visit "/movies/#{@movie_2.id}"

    expect(page).to have_link("Delete Movie")
  end

  it 'deletes the movie' do
    visit "/movies/#{@movie_1.id}"
    click_on "Delete Movie"

    expect(current_path).to eq("/movies")
    expect(page).to_not have_content(@movie_1.title)
  end
end