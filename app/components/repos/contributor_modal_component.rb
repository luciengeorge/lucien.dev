# frozen_string_literal: true

class Repos::ContributorModalComponent < MainComponent
  attr_reader :repo, :contributors

  def initialize(repo:, contributors:)
    @repo = repo
    @contributors = contributors
  end

end
