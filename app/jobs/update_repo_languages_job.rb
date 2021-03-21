class UpdateRepoLanguagesJob < ApplicationJob
  queue_as :default

  def perform(repo)
    repo.rels[:languages].get.data
  end
end
