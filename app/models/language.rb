class Language < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true
  has_many :repo_languages, dependent: :destroy
  has_many :repos, through: :repo_languages
end
