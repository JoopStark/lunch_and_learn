require 'rails_helper'

describe RecipeService do
  before :each do
    @service = RecipeService.new
  end

  context 'helper methods' do
    describe '#conn' do
      it 'returns a faraday connection' do
        expect(@service.conn).to be_a Faraday::Connection
      end
    end
  end

  context 'class methods' do
    describe '#recipes' do
      it 'returns recipes details by country', :vcr do
        # make_api_request

        search = @service.recipes('germany')

        expect(search).to be_a Hash

        expect(search).to have_key :hits
        expect(search[:hits]).to be_a(Array)

        expect(search[:hits][0]).to be_a(Hash)

        expect(search[:hits][0][:recipe]).to be_a(Hash)

        expect(search[:hits][0][:recipe]).to have_key :label
        expect(search[:hits][0][:recipe][:label]).to be_a(String)

        expect(search[:hits][0][:recipe]).to have_key :uri
        expect(search[:hits][0][:recipe][:uri]).to be_a(String)
      end
    end
  end
end
