# frozen_string_literal: true
class Repos::ListComponent < ViewComponent::Base
  attr_reader :repos

  def initialize(repos:)
    @repos = repos
  end
end
