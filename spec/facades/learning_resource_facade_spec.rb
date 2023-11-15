require "rails_helper"

describe LearningResourceFacade do
  context "class methods" do
    describe "self.resources" do
      it "displays resources when given a country", :vcr do
        # make_api_request

        resources = LearningResourceFacade.resources("germany")

        expect(resources).to be_a Object
      end
    end
  end
end