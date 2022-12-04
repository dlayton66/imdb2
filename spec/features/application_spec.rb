require 'rails_helper'

RSpec.describe "Navigation Bar" do
  # Build this out more?
  describe "User Story 8" do
    it "has a link to movies index at the top of every page" do
      visit "/directors"

      expect(page).to have_link('Movies', href: '/movies')
    end
  end
end