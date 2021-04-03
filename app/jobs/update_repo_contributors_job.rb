class UpdateRepoContributorsJob < ApplicationJob
  queue_as :default

  def perform(repo)
    @repo = $octokit.repo(repo.gh_id)
    contributors = @repo.rels[:contributors].get.data
    return if contributors.empty?

    contributors.each do |contributor|
      @contributor = Contributor.find_or_create_by(gh_id: contributor.id)
      @contributor.update(
        login: contributor.login,
        gh_id: contributor.id,
        avatar_url: contributor.avatar_url,
        profile_url: contributor.html_url,
        followers_url: contributor.followers_url,
        following_url: contributor.following_url,
        starred_url: contributor.starred_url,
        gh_type: contributor.type,
        api_url: contributor.url
      )

      repo_contributor = RepoContributor.find_or_create_by repo: repo, contributor: @contributor
      repo_contributor.update(contribution_count: contributor.contributions)
    end
    UpdateRepoCommitsJob.perform_later(repo)
  end
end
