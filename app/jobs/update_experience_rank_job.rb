class UpdateExperienceRankJob < ApplicationJob
  queue_as :default

  def perform(experience = nil)
    experiences = Experience.order(rank: :asc)
    if experience
      rank = experience.rank
      experiences.where('rank >= ?', rank).where.not(id: experience.id).find_each do |exp|
        exp.update_columns rank: exp.rank + 1
      end
    end

    experiences.each_with_index do |exp, index|
      exp.update_columns rank: index + 1
    end
  end
end
