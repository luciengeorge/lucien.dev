class UpdateWebsitesJob < ApplicationJob
  queue_as :default

  def perform
    Website.find_each do |website|
      UpdateWebsiteJob.perform_later(website)
    end
  end
end
