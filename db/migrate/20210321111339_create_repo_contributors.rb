class CreateRepoContributors < ActiveRecord::Migration[6.1]
  def change
    create_table :repo_contributors do |t|
      t.references :repo, null: false, foreign_key: true
      t.references :contributor, null: false, foreign_key: true
      t.integer :contribution_count

      t.timestamps
    end
  end
end
