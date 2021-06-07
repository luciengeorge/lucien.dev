# frozen_string_literal: true

class Experiences::ExperienceComponent < MainComponent
  attr_reader :experience

  def initialize(experience:)
    @experience = experience
  end

  def date(date)
    date.strftime('%B %Y')
  end
end
