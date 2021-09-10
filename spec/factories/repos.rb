FactoryBot.define do
  factory :repo do
    name { 'lucien-george.com' }
    full_name { 'lucien-george/lucien-george.com' }
    private { false }
    owner { { login: 'lucien-george', id: 9754165, avatar_url: 'https://avatars.githubusercontent.com/u/9754165?v=4', html_url: 'https://github.com/lucien-george', type: 'User' } }
    html_url { 'https://github.com/lucien-george/lucien-george.com' }
    api_url { 'https://api.github.com/repos/lucien-george/lucien-george.com' }
    fork { false }
    pushed_at { Time.zone.now }
    git_url { 'git://github.com/lucien-george/lucien-george.com.git' }
    homepage { 'https://lucien-george.com' }
    size { 10000 }
    stars { 0 }
    forks { 0 }
    open_issues { 0 }
    gh_id { 344446435 }
    commits_count { 100 }
  end
end
