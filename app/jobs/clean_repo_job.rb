class CleanRepoJob < ApplicationJob
  queue_as :default

  def perform(repo)
    $octokit.repo(repo.gh_id)
  rescue Octokit::NotFound => _e
    repo.destroy
  end
end
