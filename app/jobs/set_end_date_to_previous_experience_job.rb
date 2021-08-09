class SetEndDateToPreviousExperienceJob < ApplicationJob
  queue_as :default

  def perform(experience)
    last_experience = experience.company.experiences.where.not(id: experience.id).first
    return if last_experience.blank? || last_experience.end_date.present?

    last_experience.update end_date: experience.start_date
  end
end
