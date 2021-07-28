namespace :websites do
  desc "Update Websites data"
  task update: [ :environment ] do
    UpdateWebsitesJob.perform_later
  end
end
