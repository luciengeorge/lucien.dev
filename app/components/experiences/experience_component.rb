# frozen_string_literal: true

class Experiences::ExperienceComponent < MainComponent
  attr_reader :experience, :previous_experience, :next_experience

  def initialize(experience:, previous_experience:, next_experience:)
    @experience = experience
    @previous_experience = previous_experience
    @next_experience = next_experience
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

  def company
    experience.company
  end

  def company_website
    company.url
  end

  def company_logo
    company.photo.url
  end

  def company_name
    company.name
  end

  def previous_company
    return nil if previous_experience.blank?

    previous_experience.company
  end

  def next_company
    return nil if next_experience.blank?

    next_experience.company
  end

  def line_height_class
    'h-full' if next_company.present?
  end
end
