# frozen_string_literal: true

class Navbar::LinksComponent < MainComponent
  attr_reader :klasses

  def initialize(klasses:)
    super
    @klasses = klasses
  end
end
