class LearningResourceFacade
  def self.resources(country)

    video = VideoService.new.video(country)&.[](:items).map do |video|
      {youtube_video_id: video&.[](:id)&.[](:videoId),
      title: video&.[](:snippet)&.[](:title)}
    end[0]

    images = ImageService.new.images(country)&.[](:results).map do |image|
      {alt_tag: image&.[](:alt_description),
        url: image&.[](:urls)&.[](:raw)}
    end

    LearningResourceSerializer.new(LearningResource.new(country, images, video))
  
  end
end