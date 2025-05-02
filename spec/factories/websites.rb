FactoryBot.define do
  factory :website do
    title { 'Lucien George - Software Developer' }
    description { 'Lucien George is a software developer currently working for Le Wagon London' }
    image_url { 'https://www.lucien.dev/assets/cover-2d2b08ebf99736dff8d4e295830b40137352d432a89fef7eafbcfaaf658198ef.png' }
    url { 'https://www.lucien.dev' }
    association :repo
  end
end
