FactoryBot.define do
  factory :contributor do
    login { 'luciengeorge' }
    avatar_url { 'https://avatars.githubusercontent.com/u/9754165?v=4' }
    profile_url { 'https://github.com/luciengeorge' }
    followers_url { 'https://api.github.com/users/luciengeorge/followers' }
    following_url { 'https://api.github.com/users/luciengeorge/following{/other_user}' }
    starred_url { 'https://api.github.com/users/luciengeorge/starred{/owner}{/repo}' }
    gh_id  { 9754165 }
    gh_type { 'User' }
    api_url { 'https://api.github.com/users/luciengeorge' }
  end
end
