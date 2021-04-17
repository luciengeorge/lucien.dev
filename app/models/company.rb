class Company < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_one_attached :logo

  geocoded_by :location

  validates :logo, presence: true
  validates :website, presence: true
  validates :location, presence: true
  validates :lagitude, presence: true
  validates :longitude, presence: true

  after_validation :geocode, if: :will_save_change_to_location?
end
