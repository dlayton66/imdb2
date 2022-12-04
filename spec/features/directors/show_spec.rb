require 'rails_helper'
require 'test_helper'

RSpec.describe "Directors Index" do

  before :each do
    seed_kubrick
    seed_pta
  end

  describe "User Story 2" do
    describe "User visits '/directors/:id'" do
      it "shows the attributes for that director" do
        visit "/directors/#{
                            Director.find_by(
                                             firstname: @director_1.firstname, 
                                             lastname: @director_1.lastname
                                            ).id
                           }"

        expect(page).to have_content(@director_1.fullname)
        expect(page).to have_content("Alive: #{@director_1.alive}")
        expect(page).to have_content("Age: #{@director_1.age}")
      end
    end
  end

  describe "User Story 7" do
    describe "User visits '/directors/:id'" do
      it "shows how many movie records that director has" do
        director_id = Director.find_by(firstname: @director_1.firstname, 
                                       lastname: @director_1.lastname).id
        visit "/directors/#{director_id}"

        expect(page).to have_content("Number of movies: #{@director_1.movies.count}")
      end
    end
  end

  describe "User Story 10" do
    describe "User visits '/directors/:id'" do
      it "has a link to that director's movies index page" do
        director_id = Director.find_by(firstname: @director_1.firstname, 
                                       lastname: @director_1.lastname).id
        visit "/directors/#{director_id}"

        expect(page).to have_link(href: "/directors/#{director_id}/movies")

        director_id = Director.find_by(firstname: @director_2.firstname, 
          lastname: @director_2.lastname).id
        visit "/directors/#{director_id}"

        expect(page).to have_link(href: "/directors/#{director_id}/movies")
      end
    end
  end
end