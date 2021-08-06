class UpdateRepoJob < ApplicationJob
  queue_as :default

  def perform(repo_gh_id)
    @repo_gh_id = repo_gh_id
    @github_repo = $octokit.repo(@repo_gh_id)
    @repo = Repo.find_by(gh_id: @repo_gh_id) || Repo.find_by(full_name: @github_repo.full_name)
    @repo.present? ? update_repo : create_repo
    UpdateRepoLanguagesJob.perform_later(@repo)
    UpdateRepoContributorsJob.perform_later(@repo)
  end

  private

  def update_repo
    @repo.update!(
      gh_id: @repo_gh_id,
      name: @github_repo.name,
      full_name: @github_repo.full_name,
      private: @github_repo.private,
      owner_login: @github_repo.owner.login,
      owner_id: @github_repo.owner.id,
      owner_avatar_url: @github_repo.owner.avatar_url,
      owner_html_url: @github_repo.owner.html_url,
      owner_type: @github_repo.owner.type,
      html_url: @github_repo.html_url,
      api_url: @github_repo.url,
      fork: @github_repo.fork,
      pushed_at: @github_repo.pushed_at,
      git_url: @github_repo.git_url,
      homepage: @github_repo.homepage,
      size: @github_repo.size,
      stars: @github_repo.stargazers_count,
      forks: @github_repo.forks_count,
      open_issues: @github_repo.open_issues_count
    )
  end

  def create_repo
    @repo = Repo.create!(
      gh_id: @repo_gh_id,
      name: @github_repo.name,
      full_name: @github_repo.full_name,
      private: @github_repo.private,
      owner_login: @github_repo.owner.login,
      owner_id: @github_repo.owner.id,
      owner_avatar_url: @github_repo.owner.avatar_url,
      owner_html_url: @github_repo.owner.html_url,
      owner_type: @github_repo.owner.type,
      html_url: @github_repo.html_url,
      api_url: @github_repo.url,
      fork: @github_repo.fork,
      pushed_at: @github_repo.pushed_at,
      git_url: @github_repo.git_url,
      homepage: @github_repo.homepage,
      size: @github_repo.size,
      stars: @github_repo.stargazers_count,
      forks: @github_repo.forks_count,
      open_issues: @github_repo.open_issues_count
    )
  end
end
