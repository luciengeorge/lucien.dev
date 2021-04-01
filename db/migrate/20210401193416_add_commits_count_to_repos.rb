class AddCommitsCountToRepos < ActiveRecord::Migration[6.1]
  def up
    add_column :repos, :commits_count, :integer

    Repo.find_each do |repo|
      Repo.reset_counters(repo.id, :commits)
    end
  end

  def def down
    remove_column :repos, :commits_count, :integer
  end
end
