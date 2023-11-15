require "rails_helper"

describe SessionFacade do
  context "class methods" do
    describe "self.create" do
      it "authenticates so the front can create a session" do
        user = User.create!( name: "Jason", email: 'dave@aol.com', password: 'Password12?', api_key: 111222333)
        params = {email: 'dave@aol.com', password: 'Password12?'}

        session = SessionFacade.create(params)

        expect(session[:json]).to be_a Object
        expect(session[:status]).to eq(:created)
      end
    end
  end
end