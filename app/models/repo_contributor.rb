class RepoContributor < ApplicationRecord
  belongs_to :repo, touch: true
  belongs_to :contributor, touch: true
end
