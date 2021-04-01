# frozen_string_literal: true

class Repos::BreadcrumbsComponent < MainComponent
  attr_reader :repo

  def initialize(repo:)
    super
    @repo = repo
  end

  def path
    repo.full_name
  end

  def language_color
    repo.language&.color
  end

  def owner_avatar
    repo.owner_avatar_url
  end

  def path_sections
    path.split('/')
  end

  def url
    "https://github.com"
  end
end
