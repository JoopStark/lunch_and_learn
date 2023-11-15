class ErrorSerializer

   def initialize(error_object)
      @error_object = error_object
   end

   def serialize_json
      @error_object.map do |key, value|
        key.to_s << " " << value[0]
      end
   end

end