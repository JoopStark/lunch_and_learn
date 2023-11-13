class TourismSiteSerializer
  include JSONAPI::Serializer
  attributes :id, :type, :address, :place_id
end