require 'rails_helper'

describe PlaceService do
  before :each do
    @service = PlaceService.new
  end

  context 'helper methods' do
    describe '#conn' do
      it 'returns a faraday connection' do
        expect(@service.conn).to be_a Faraday::Connection
      end
    end
  end

  context 'class methods' do
    xdescribe '#test' do
      it 'expect test to return data', :vcr do
        # make_api_request

        restaurants = @service.test

        # binding.pry
        expect(restaurants).to be_a Hash
        expect(restaurants[:type]).to be_a String
      end
    end
  


    describe '#tourism' do
      it 'expect to return tourism data', :vcr do
        # make_api_request

        tourism = @service.tourism([12.1, -68.92])

        binding.pry
        expect(tourism).to be_a Hash
        # expect(restaurants[:type]).to be_a String
      end
    end
  end
end
