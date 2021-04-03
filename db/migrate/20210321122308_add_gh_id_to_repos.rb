class AddGhIdToRepos < ActiveRecord::Migration[6.1]
  def change
    add_column :repos, :gh_id, :integer
  end
end
