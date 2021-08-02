class Website < ApplicationRecord
  belongs_to :repo, optional: true

  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  before_save :extract_data

  CHUNKS = 4
  MAX_CHARS = 100

  private

  def extract_data
    response = RestClient.get(url)
    ogp = OGP::OpenGraph.new(response)
    self.title = ogp.title
    self.description = ogp.description
    self.image_url = ogp.images.first.url
    self
  end
end
