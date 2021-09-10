FactoryBot.define do
  factory :education do
    association :school
    start_date { Time.zone.now - 1.year }
    end_date { Time.zone.now }
    degree { 'BEng. Software Engineering' }
  end
end
