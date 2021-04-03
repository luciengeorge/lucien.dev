namespace :repos do
  desc "Update Repos data"
  task update: [ :environment ] do
    UpdateReposJob.perform_later
  end
end
