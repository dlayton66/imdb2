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
  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.

  describe "User Story 11" do
    describe "User visits '/directors'" do
      it "links to the create director page" do
        visit "/directors"

        click_on 'Create Director'

        expect(current_path).to eq('/directors/new')
      end
    end
  end
end