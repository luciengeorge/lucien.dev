class CleanReposJob < ApplicationJob
  queue_as :default

  def perform
    Repo.find_each do |repo|
      CleanRepoJob.perform_later(repo)
    end
  end
end
