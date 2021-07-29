class SetEndDateToPreviousExperienceJob < ApplicationJob
  queue_as :default

  def perform(experience)
    last_experience = experience.company.experiences.reject { |exp| exp == experience }.first
    return if last_experience.end_date.present?

    last_experience.update end_date: experience.start_date
  end
end
