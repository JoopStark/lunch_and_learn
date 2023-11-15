require "rails_helper"

describe RecipeFacade do
  context "class methods" do
    describe "self.create" do
      it "creates resources when given a country", :vcr do
        # make_api_request

        recipe = RecipeFacade.index("germany")

        expect(recipe[:json]).to be_a Object
      end
    end
  end
end