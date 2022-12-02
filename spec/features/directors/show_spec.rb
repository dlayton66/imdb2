require "rails_helper"

RSpec.describe "Directors Index" do

  before :each do
    director_1 = Director.create!(firstname: "Stanley",
      lastname: "Kubrick",
      alive: false,
      age: 70)
      
    director_2 = Director.create!(firstname: "Paul Thomas",
      lastname: "Anderson",
      alive: true,
      age: 52)
  end

  describe "User Story 2" do
    describe "User visits '/directors/:id'" do
      it "shows the attributes for that director" do
        director_id = Director.find_by(firstname: "Stanley", lastname: "Kubrick").id
        visit "/directors/#{director_id}"

        expect(page).to have_content("Stanley Kubrick")
        expect(page).to have_content("Alive: false")
        expect(page).to have_content("Age: 70")
      end
    end
  end
end