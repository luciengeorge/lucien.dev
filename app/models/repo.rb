class Repo < ApplicationRecord
  validates :gh_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :full_name, presence: true, uniqueness: true

  store :owner, accessors: %i[login id avatar_url html_url type], prefix: true, coder: JSON

  has_many :repo_collaborators
  has_many :collaborators, through: :repo_collaborators
  has_many :repo_languages
  has_many :languages, through: :repo_languages
  has_many :commits

  def language
    return nil if repo_languages.empty?

    repo_languages.order(size: :desc).first.language
  end
end
