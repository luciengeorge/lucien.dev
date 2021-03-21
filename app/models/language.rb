class Language < ApplicationRecord
  has_many :repo_languages
  has_many :repos, through: :repo_languages
end
