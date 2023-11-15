require "rails_helper"

describe UserFacade do
  context "class methods" do
    describe "self.create" do
      xit "creates a user and returns a hash" do
        params = {"name": "Jason", "email": "dave@aol.com", "password": "Password12?", "password_confirmation": "Password12?"}

        expect(UserFacade.create(params)[:json]).to be_a Hash
        expect(UserFacade.create(params)).to eq("")
      end
    end
  end
end