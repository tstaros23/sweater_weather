class BackgroundSerializer
  def self.format_json(image)
    {
      data: {
        type: "image",
        id: nil,
        attributes: {
          image: {
            location: image[0].location,
            image_url: image[0].url,
            credit: {
              source: image[0].source,
              author: image[0].author_name
            }
          }
        }
      }
    }
  end
end
