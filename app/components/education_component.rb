# frozen_string_literal: true

class EducationComponent < MainComponent
  attr_reader :education, :download

  def initialize(education:, download:)
    @education = education
    @download = download
  end

  def date
    if education.start_date.year == education.end_date&.year
      education.start_date.year
    elsif education.end_date.blank?
      "#{education.start_date.year} - present"
    else
      "#{education.start_date.year} - #{education.end_date.year}"
    end
  end

  def school
    education.school
  end
end
