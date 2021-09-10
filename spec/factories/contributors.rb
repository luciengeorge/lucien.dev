FactoryBot.define do
  factory :contributor do
    login { 'lucien-george' }
    avatar_url { 'https://avatars.githubusercontent.com/u/9754165?v=4' }
    profile_url { 'https://github.com/lucien-george' }
    followers_url { 'https://api.github.com/users/lucien-george/followers' }
    following_url { 'https://api.github.com/users/lucien-george/following{/other_user}' }
    starred_url { 'https://api.github.com/users/lucien-george/starred{/owner}{/repo}' }
    gh_id  { 9754165 }
    gh_type { 'User' }
    api_url { 'https://api.github.com/users/lucien-george' }
  end
end
