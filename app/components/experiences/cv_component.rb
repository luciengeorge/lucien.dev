# frozen_string_literal: true

class Experiences::CvComponent < MainComponent
  attr_reader :experiences, :programming_languages, :spoken_languages, :educations, :download

  def initialize(experiences:, programming_languages:, spoken_languages:, educations:, download:)
    @experiences = experiences
    @programming_languages = programming_languages
    @spoken_languages = spoken_languages
    @educations = educations
    @download = download
  end
end
