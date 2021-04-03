class Language < ApplicationRecord
  has_many :repo_languages, dependent: :destroy
  has_many :repos, through: :repo_languages
end
