require 'rails_helper'
require 'test_helper'

describe "User Story 19" do
  before :each do
    seed_kubrick
    seed_pta
  end

  it 'adds a link to delete director from show page' do
    visit "/directors/#{@director_1.id}"

    expect(page).to have_link("Delete Director")

    visit "/directors/#{@director_2.id}"

    expect(page).to have_link("Delete Director")
  end

  it 'deletes the director' do
    visit "/directors/#{@director_1.id}"
    click_on "Delete Director"

    expect(current_path).to eq("/directors")
    expect(page).to_not have_content(@director_1.fullname)
  end
end