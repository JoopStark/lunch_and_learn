require 'rails_helper'

describe CountryService do
  before :each do
    @country = CountryService.new
  end

  context 'helper methods' do
    describe '#conn' do
      it 'returns a faraday connection' do
        expect(@country.conn).to be_a Faraday::Connection
      end
    end
  end

  context 'class methods' do
    describe '#country' do
      it 'returns random country', :vcr do
        # make_api_request

        country = @country.country

        expect(country).to be_a String
      end
    end

    describe '#capitol_location' do
      it 'returns location of capitol', :vcr do
        make_api_request

        capitol = @country.capitol_location("Latvia")

        expect(capitol).to be_a Array
      end
    end
  end
end
