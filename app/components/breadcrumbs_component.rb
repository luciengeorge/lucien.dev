# frozen_string_literal: true

class BreadcrumbsComponent < MainComponent
  attr_reader :path

  def initialize(path:)
    super
    @path = path
  end

  def path_sections
    path.split('/')
  end

  def url
    "https://github.com"
  end
end
