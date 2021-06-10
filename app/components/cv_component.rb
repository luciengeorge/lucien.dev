# frozen_string_literal: true

class CvComponent < MainComponent
  attr_reader :experiences, :programming_languages, :spoken_languages, :educations

  def initialize(experiences:, programming_languages:, spoken_languages:, educations:)
    @experiences = experiences
    @programming_languages = programming_languages
    @spoken_languages = spoken_languages
    @educations = educations
  end
end
