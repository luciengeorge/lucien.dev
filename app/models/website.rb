class Website < ApplicationRecord
  belongs_to :repo, optional: true

  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  before_save :extract_data

  private

  def extract_data
    ogp = OpenGraph.new(url)
    self.title = ogp.title
    self.description = ogp.description
    self.image_url = ogp.images.first
  end
end
