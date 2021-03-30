class Commit < ApplicationRecord
  belongs_to :collaborator, optional: true
  belongs_to :repo

  validates :sha, presence: true, uniqueness: true
  validates :message, presence: true
  validates :url, presence: true
  validates :html_url, presence: true
end
