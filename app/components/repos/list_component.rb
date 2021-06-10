# frozen_string_literal: true
class Repos::ListComponent < MainComponent
  attr_reader :repos

  def initialize(repos:)
    @repos = repos
  end
end
