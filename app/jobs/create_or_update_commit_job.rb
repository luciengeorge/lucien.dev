class CreateOrUpdateCommitJob < ApplicationJob
  queue_as :default

  def perform(repo, commit)
    @commit = Commit.find_or_create_by(sha: commit[:sha])
    @commit.update!(
      message: commit.dig(:commit, :message),
      pushed_at: commit.dig(:commit, :author, :date),
      repo: repo,
      contributor: Contributor.find_by(login: commit.dig(:author, :login)),
      url: commit[:url],
      html_url: commit[:html_url]
    )
  end
end
