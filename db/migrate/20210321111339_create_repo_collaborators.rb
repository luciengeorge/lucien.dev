class CreateRepoCollaborators < ActiveRecord::Migration[6.1]
  def change
    create_table :repo_collaborators do |t|
      t.references :repo, null: false, foreign_key: true
      t.references :collaborator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
