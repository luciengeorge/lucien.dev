# frozen_string_literal: true

class Websites::WebsitesPhoneComponent < MainComponent
  attr_reader :websites

  def initialize(websites:)
    @websites = websites
  end
end
