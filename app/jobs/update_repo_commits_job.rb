class UpdateRepoCommitsJob < ApplicationJob
  queue_as :default

  def perform(repo)
    @repo = $octokit.repo(repo.gh_id)
    commits = @repo.rels[:commits].get.data
    commits.each do |commit|
      @commit = Commit.find_or_create_by(sha: commit.sha, url: commit.url, html_url: commit.html_url)
      @commit.update(
        sha: commit.sha,
        message: commit.commit&.message,
        pushed_at: commit.commit&.author&.date,
        repo: repo,
        contributor: Contributor.find_by(login: commit.author&.login),
        url: commit.url,
        html_url: commit.html_url
      )
    end
  rescue Octokit::Error => e
    p e
  end
end
