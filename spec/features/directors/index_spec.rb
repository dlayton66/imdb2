require "rails_helper"

RSpec.describe "Directors Index" do

  describe "User Story 1" do
    describe "User visits '/directors'" do
      it "shows the name of every director" do
        director_1 = Director.create!(firstname: "Stanley",
                                     lastname: "Kubrick",
                                     alive: false,
                                     age: 70)
        director_2 = Director.create!(firstname: "Paul Thomas",
                                     lastname: "Anderson",
                                     alive: true,
                                     age: 52)

        visit "/directors"

        expect(page).to have_content("Stanley Kubrick")
        expect(page).to have_content("Paul Thomas Anderson")
      end
    end
  end

end