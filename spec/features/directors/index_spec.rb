require "rails_helper"

RSpec.describe "Directors Index" do

  before :each do
    @director_1 = Director.create!(firstname: "Stanley",
                                  lastname: "Kubrick",
                                  alive: false,
                                  age: 70)
      
    @director_2 = Director.create!(firstname: "Paul Thomas",
                                  lastname: "Anderson",
                                  alive: true,
                                  age: 52)
                                  
    @director_3 = Director.create!(firstname: "Ed",
                                  lastname: "Wood",
                                  alive: false,
                                  age: 54)

    @director_4 = Director.create!(firstname: "Jim",
                                  lastname: "Jarmusch",
                                  alive: true,
                                  age: 69)
  end

  describe "User Story 1" do
    describe "User visits '/directors'" do
      it "shows the name of every director" do
        visit "/directors"

        expect(page).to have_content("Stanley Kubrick")
        expect(page).to have_content("Paul Thomas Anderson")
      end
    end
  end

  describe "User Story 6" do
    describe "User visits '/directors'" do
      it "orders directors by most recently created" do
        visit "/directors"

        kubrick = page.body.index(@director_1.fullname)
        pta = page.body.index(@director_2.fullname)
        wood = page.body.index(@director_3.fullname)
        jarmusch = page.body.index(@director_4.fullname)

        expect(kubrick).to be < pta
        expect(pta).to be < wood
        expect(wood).to be < jarmusch
      end

      it "shows when each record was created" do
        visit "/directors"

        expect(page).to have_content(@director_1.created_at)
        expect(page).to have_content(@director_2.created_at)
        expect(page).to have_content(@director_3.created_at)
        expect(page).to have_content(@director_4.created_at)
      end
    end
  end
end