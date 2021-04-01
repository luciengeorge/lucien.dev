class RepoCollaborator < ApplicationRecord
  belongs_to :repo, touch: true
  belongs_to :collaborator, touch: true
end
