FactoryBot.define do
  factory :repo do
    name { 'lucien.dev' }
    full_name { 'luciengeorge/lucien.dev' }
    private { false }
    owner { { login: 'luciengeorge', id: 9754165, avatar_url: 'https://avatars.githubusercontent.com/u/9754165?v=4', html_url: 'https://github.com/luciengeorge', type: 'User' } }
    html_url { 'https://github.com/luciengeorge/lucien.dev' }
    api_url { 'https://api.github.com/repos/luciengeorge/lucien.dev' }
    fork { false }
    pushed_at { Time.zone.now }
    git_url { 'git://github.com/luciengeorge/lucien.dev.git' }
    homepage { 'https://lucien.dev' }
    size { 10000 }
    stars { 0 }
    forks { 0 }
    open_issues { 0 }
    gh_id { 344446435 }
    commits_count { 100 }
  end
end
