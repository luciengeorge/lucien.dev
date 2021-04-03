class RepoLanguage < ApplicationRecord
  belongs_to :language, touch: true
  belongs_to :repo, touch: true
end
