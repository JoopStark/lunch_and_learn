class LearningResource
  attr_reader :id, :country, :video, :images
  def initialize(country, images, video)
    @id = nil
    @country = country
    @images = images_check(images)
    @video = video_check(video)
  end

  def images_check(images)
    images ? images : []
  end
  def video_check(video)
    video ? video : {}
  end
end