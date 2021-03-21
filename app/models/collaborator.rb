class Collaborator < ApplicationRecord
  has_many :repo_collaborators
  has_many :repos, through: :repo_collaborators
end
