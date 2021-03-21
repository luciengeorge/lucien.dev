class RepoLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :repo
end
