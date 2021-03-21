class UpdateRepoJob < ApplicationJob
  queue_as :default

  def perform(repo_gh_id)
    @repo = Repo.find_by gh_id: repo_gh_id
    @repo.present? ? update_repo : create_repo
    UpdateRepoLanguagesJob.perform_later(@repo)
  end

  private

  def update_repo
    @repo.update(
      name: repo.name,
      full_name: repo.full_name,
      private: repo.private,
      owner: repo.owner,
      html_url: repo.html_url,
      api_url: repo.url,
      fork: repo.fork,
      pushed_at: repo.pushed_at,
      git_url: repo.git_url,
      homepage: repo.homepage,
      size: repo.size,
      stars: repo.stargazers_count,
      forks: repo.forks_count,
      open_issues: repo.open_issues_count
    )
  end

  def create_repo
    @repo = Repo.create(
      gh_id: repo_gh_id,
      name: repo.name,
      full_name: repo.full_name,
      private: repo.private,
      owner: repo.owner,
      html_url: repo.html_url,
      api_url: repo.url,
      fork: repo.fork,
      pushed_at: repo.pushed_at,
      git_url: repo.git_url,
      homepage: repo.homepage,
      size: repo.size,
      stars: repo.stargazers_count,
      forks: repo.forks_count,
      open_issues: repo.open_issues_count
    )
  end
end
