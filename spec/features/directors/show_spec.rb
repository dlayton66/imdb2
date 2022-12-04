require "rails_helper"

RSpec.describe "Directors Index" do

  before :each do
    @director_1 = Director.create!(firstname: "Stanley",
      lastname: "Kubrick",
      alive: false,
      age: 70)

    @movie_1 = @director_1.movies.create!(title: "Eyes Wide Shut",
      runtime: 159,
      release: '1999-07-16',
      like: true,
      dmst_gross: 55_691_208,
      intl_gross: 106_551_476)

    @movie_3 = @director_1.movies.create!(title: "2001: A Space Odyssey",
            runtime: 149,
            release: '1968-04-03',
            like: true,
            dmst_gross: 60_481_243,
            intl_gross: 5_400_507)
      
    @director_2 = Director.create!(firstname: "Paul Thomas",
      lastname: "Anderson",
      alive: true,
      age: 52)
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