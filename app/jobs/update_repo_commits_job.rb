class UpdateRepoCommitsJob < ApplicationJob
  queue_as :default

  def perform(repo)
    commits = $octokit.commits(repo.gh_id)
    commits.each do |commit|
      CreateOrUpdateCommitJob.perform_later(repo, commit.to_h)
    end
    Repo.reset_counters(repo.id, :commits)
  end
end
