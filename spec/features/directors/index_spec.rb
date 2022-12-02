require 'rails_helper'

RSpec.describe 'Directors Index' do

  describe 'User Story 1' do
    describe "User visits '/parents'" do
      it 'shows the name of every parent record' do
        director_1 = Director.create(firstname: "Stanley",
                                     surname: "Kubrick",
                                     )
      end
    end
  end

end