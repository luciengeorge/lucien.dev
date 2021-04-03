# frozen_string_literal: true

class Repos::RepoComponent < MainComponent
  attr_reader :repo

  def initialize(repo:)
    @repo = repo
  end

  def language_name
    repo.language&.name
  end

  def contributors
    repo.contributors
  end
end
