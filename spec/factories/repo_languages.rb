FactoryBot.define do
  factory :repo_language do
    association :language
    association :repo
    size { 1000 }
  end
end
