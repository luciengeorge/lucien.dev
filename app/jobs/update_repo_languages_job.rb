class UpdateRepoLanguagesJob < ApplicationJob
  queue_as :default

  def perform(repo)
    # Do something later
  end
end
