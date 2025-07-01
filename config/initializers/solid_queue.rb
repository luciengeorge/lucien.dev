# Rails 8 Solid Queue Configuration
# Solid Queue is a database-backed job queue for Rails 8

Rails.application.configure do
  # Use Solid Queue as the Active Job adapter
  config.active_job.queue_adapter = :solid_queue
  
  # Optional: Configure queue settings
  # config.solid_queue.connects_to = { database: { writing: :solid_queue, reading: :solid_queue } }
end

# Configure Solid Queue behavior
SolidQueue.configure do |config|
  # Number of worker processes to spawn
  config.default_concurrency = 3
  
  # How often to poll for new jobs (in seconds)
  config.polling_interval = 0.1
  
  # Queue configuration
  config.queues = "default:3,mailers:2"
  
  # Cleanup old jobs after 30 days
  config.clear_finished_jobs_after = 30.days
end