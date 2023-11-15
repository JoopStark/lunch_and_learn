require "rails_helper"

describe TouristSiteFacade do
  context "class methods" do
    describe "self.index" do
      it "displays tourist sights when given a country", :vcr do
        # make_api_request

        sights = TouristSiteFacade.index("germany")

        expect(sights).to be_a Object
      end
    end
  end
end