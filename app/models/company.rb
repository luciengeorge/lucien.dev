class Company < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address

  # validates :photo, presence: true
  validates :website, presence: true
  validates :address, presence: true

  after_validation :geocode, if: :will_save_change_to_address?
  before_save :normalize_website, if: :will_save_change_to_website?

  def url
    "http://#{website}"
  end

  private

  def normalize_website
    self.website = (website || "").sub(/https?\:\/\//, '').sub(/\/$/, '').strip
  end
end
