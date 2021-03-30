class UpdateRepoCommitsJob < ApplicationJob
  queue_as :default

  def perform(repo)
    @repo = $octokit.repo(repo.gh_id)
    commits = @repo.rels[:commits].get.data
    commits.each do |commit|
      @commit = Commit.create_with(
        sha: commit.sha,
        message: commit.commit&.message,
        repo: repo,
        collaborator: Collaborator.find_by(login: commit.author&.login),
        url: commit.url,
        html_url: commit.html_url
      ).find_or_create_by(sha: commit.sha)
    end
  rescue Octokit::Error => e
    p e
  end
end
