require 'rails_helper'

describe ImageService do
  before :each do
    @image = ImageService.new
  end

  context 'helper methods' do
    describe '#conn' do
      it 'returns a faraday connection' do
        expect(@image.conn).to be_a Faraday::Connection
      end
    end
  end

  context 'class methods' do
    describe '#country' do
      it 'returns random country', :vcr do
        # make_api_request

        image_data = @image.images("germany")

        expect(image_data).to be_a Hash
        expect(image_data[:results]).to be_a Array
        expect(image_data[:results][0][:urls]).to be_a Hash
        expect(image_data[:results][0][:urls][:raw]).to be_a String

        expect(image_data[:results][0][:alt_description]).to be_a String
      end
    end

    
  end
end
