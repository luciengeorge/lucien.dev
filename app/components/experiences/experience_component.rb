# frozen_string_literal: true

class Experiences::ExperienceComponent < MainComponent
  attr_reader :experience

  def initialize(experience:)
    @experience = experience
  end

  def start_date
    experience.start_date.strftime('%B %Y')
  end

  def end_date
    experience.end_date.present? ? experience.end_date.strftime('%B %Y') : 'present'
  end

  def job_type
    experience.job_type.dasherize.capitalize
  end

  def company_website
    experience.company.url
  end

  def company_logo
    experience.company.photo.service_url
  end

  def company_name
    experience.company.name
  end
end
