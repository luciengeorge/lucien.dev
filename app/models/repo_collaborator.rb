class RepoCollaborator < ApplicationRecord
  belongs_to :repo
  belongs_to :collaborator
end
