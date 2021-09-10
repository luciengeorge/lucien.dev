FactoryBot.define do
  factory :experience do
    title { 'Co-Founder' }
    start_date { Time.zone.now.to_date - 1.year }
    end_date { Time.zone.now.to_date }
    association :company
    job_type { :full_time }
    rank { 1 }
    hidden { false }
    description { 'co founder' }
  end
end
