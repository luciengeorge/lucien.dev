class UpdateExperienceRankJob < ApplicationJob
  queue_as :default

  def perform
    Experience.order(rank: :asc).find_each do |experience|
      Experience.update rank: experience.rank + 1
    end
  end
end
