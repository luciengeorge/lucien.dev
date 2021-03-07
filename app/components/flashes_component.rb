# frozen_string_literal: true

class FlashesComponent < MainComponent
  attr_reader :notice, :alert

  def initialize(notice:, alert:)
    super
    @notice = notice
    @alert = alert
  end
end
