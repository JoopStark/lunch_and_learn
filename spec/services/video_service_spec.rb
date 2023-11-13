require 'rails_helper'

describe VideoService do
  before :each do
    @video = VideoService.new
  end

  context 'helper methods' do
    describe '#conn' do
      it 'returns a faraday connection' do
        expect(@video.conn).to be_a Faraday::Connection
      end
    end
  end

  context 'class methods' do
    describe '#video' do
      it 'returns a video', :vcr do
        make_api_request

        video_data = @video.video("germany")

        expect(video_data).to be_a Hash
        expect(video_data[:items]).to be_a Array
        expect(video_data[:items].count).to eq(1)

        expect(video_data[:items][0][:id]).to be_a Hash
        expect(video_data[:items][0][:id][:videoId]).to be_a String

        expect(video_data[:items][0][:snippet]).to be_a Hash
        expect(video_data[:items][0][:snippet][:title]).to be_a String
      end
    end
  end
end
