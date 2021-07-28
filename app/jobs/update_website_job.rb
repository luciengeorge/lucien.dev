class UpdateWebsiteJob < ApplicationJob
  queue_as :default

  def perform(website)
    website.save
  end
end
