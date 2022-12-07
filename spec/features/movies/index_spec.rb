require 'rails_helper'
require 'test_helper'

RSpec.describe "Movies Index" do
  before :each do
    seed_kubrick
    seed_pta
    seed_wood
  end

  describe "User Story 3" do
    describe "User visits '/movies'" do
      it "shows all movies and their attributes" do
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

  describe "User Story 15" do
    it 'only shows movies where like is true' do
      visit "/movies"

      expect(page).to have_content("#{@movie_1.title}")
      expect(page).to have_content("#{@movie_2.title}")
      expect(page).to have_content("#{@movie_3.title}")
      expect(page).to have_content("#{@movie_4.title}")
      expect(page).to_not have_content("#{@movie_5.title}")
      expect(Movie.find_by(title: @movie_5.title)).to_not be(nil)
    end
  end

  describe "User Story 16" do
    it 'adds a link to sort movies alphabetically' do
      visit "/movies"
      click_on "Sort Alphabetically"
      
      expect(has_current_path?("/movies?sort=true")).to be true
    end

    it 'displays the movies alphabetically' do
      visit "/movies"

      expect("Eyes Wide Shut").to appear_before("2001: A Space Odyssey")

      click_on "Sort Alphabetically"

      expect("2001: A Space Odyssey").to appear_before("Eyes Wide Shut")
    end
  end

  describe "User Story 18" do
    it 'adds links to edit movies from index' do
      visit "/movies"

      expect(page).to have_link("Edit", href: "/movies/#{@movie_1.id}/edit")
      expect(page).to have_link("Edit", href: "/movies/#{@movie_2.id}/edit")
      expect(page).to have_link("Edit", href: "/movies/#{@movie_3.id}/edit")
    end
  end

  describe "User Story 23" do
    it 'adds links to delete movies from movies index' do
      visit "/movies"
      expect(page).to have_link("Delete", href: "/movies/#{@movie_1.id}")
      expect(page).to have_link("Delete", href: "/movies/#{@movie_2.id}")
      expect(page).to have_link("Delete", href: "/movies/#{@movie_3.id}")
      expect(page).to have_link("Delete", href: "/movies/#{@movie_4.id}")
      expect(page).to have_content("#{@movie_1.title}")

      first(:link, 'Delete').click

      expect(page).to_not have_content("#{@movie_1.title}")
    end
  end
end