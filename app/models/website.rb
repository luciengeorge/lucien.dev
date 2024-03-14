class Website < ApplicationRecord
  belongs_to :repo, optional: true

  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  before_save :extract_data

  CHUNK = 1
  CHUNKS = 4
  MAX_CHARS = 100

  private

  def extract_data
    response = RestClient.get(url)
    ogp = OGP::OpenGraph.new(response)
    self.title = ogp.title
    self.description = ogp.description
    image_url = ogp.images.first.url
    if image_url.start_with?('/')
      image_url = URI.join(ogp.url, image_url).to_s
    end
    self.image_url = image_url
    self
  end
end
