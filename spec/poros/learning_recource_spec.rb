require "rails_helper"

RSpec.describe LearningResource do
  it "takes a hash and makes a ruby object" do
    country = "germany"
    images =
      [{:alt_tag=>"dog",
      :url=>"https://www.dog.com"},
      {:alt_tag=>"cat",
      :url=>"https://www.cat.com"},
      {:alt_tag=>"bird",
      :url=>"https://www.bird.com"},]
    video = {:youtube_video_id=>"7sxora2imC0", :title=>"A Super Quick History of Germany"}

    resource = LearningResource.new(country, images, video)

    expect(resource).to be_a(LearningResource)
    expect(resource.country).to eq("germany")
    expect(resource.images.count).to eq(3)
    expect(resource.images[0][:alt_tag]).to eq("dog")
    expect(resource.images[0][:url]).to eq("https://www.dog.com")
    expect(resource.video).to eq({:youtube_video_id=>"7sxora2imC0", :title=>"A Super Quick History of Germany"})
  end
end