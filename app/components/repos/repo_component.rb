# frozen_string_literal: true

class Repos::RepoComponent < MainComponent
  attr_reader :repo

  MAX = 99

  def initialize(repo:)
    @repo = repo
  end

  def language_name
    repo.language&.name
  end

  def first_contributors
    contributors.first(10)
  end

  def contributors
    repo.contributors
  end

  def remaining_contributors
    [contributors.size - first_contributors.size, MAX].min
  end

  def color(language)
    language.color || '#cccccc'
  end
end
