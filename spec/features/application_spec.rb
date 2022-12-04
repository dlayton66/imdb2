require 'rails_helper'

RSpec.describe "Navigation Bar" do

  ########## Build these out more? ##########
  # Could also test top of page condition

  describe "User Story 8" do
    it "has a link to movies index at the top of every page" do
      visit '/directors'
      expect(page).to have_link('Movies', href: '/movies')

      visit '/movies'
      expect(page).to have_link('Movies', href: '/movies')
    end
  end

  describe "User Story 9" do
    it "has a link to directors index at the top of every page" do
      visit '/directors'
      expect(page).to have_link('Directors', href: '/directors')

      visit '/movies'
      expect(page).to have_link('Directors', href: '/directors')
    end
  end
end