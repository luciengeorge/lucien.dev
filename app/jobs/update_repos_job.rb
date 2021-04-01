class UpdateReposJob < ApplicationJob
  queue_as :default

  def perform
    repos = $octokit.repos.select { |repo| repo.permissions.push }
    repos.each do |repo|
      UpdateRepoJob.perform_later(repo.id)
    end
  end
end
