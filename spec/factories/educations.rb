FactoryBot.define do
  factory :education do
    association :school
    start_date { Time.zone.now - 1.year }
    end_date { Time.zone.now }
    degree { 'BEng. Software Engineering' }
    description { "Attended Le Wagon London (Batch #190).\n9-week intensive coding bootcamp learning HTML, CSS, Bootstrap, JavaScript ES2015,\nSQL, git, GitHub, Heroku, Ruby on Rails, React and Redux. Designed, implemented and shipped to\nproduction a clone of AirBnB for boats (https://ports-idk.herokuapp.com) and a Rails prototype of an activity generator for indecisive people (https://idk-app.herokuapp.com/)." }
  end
end
