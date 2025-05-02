FactoryBot.define do
  factory :commit do
    association :contributor
    association :repo
    message { 'Creating unit tests' }
    sha { '5b763f3cea848c648713910ba31272af6e915532' }
    url { 'https://api.github.com/repos/luciengeorge/lucien.dev/commits/5b763f3cea848c648713910ba31272af6e915532' }
    html_url { 'https://github.com/luciengeorge/lucien.dev/commit/5b763f3cea848c648713910ba31272af6e915532' }
    pushed_at { Time.zone.now }
  end
end
