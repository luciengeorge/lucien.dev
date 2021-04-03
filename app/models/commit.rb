class Commit < ApplicationRecord
  belongs_to :contributor, optional: true, touch: true
  belongs_to :repo, touch: true, counter_cache: true

  validates :sha, presence: true, uniqueness: true
  validates :url, presence: true
  validates :html_url, presence: true
end
