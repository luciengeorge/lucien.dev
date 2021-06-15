# frozen_string_literal: true

class Navbar::BaseComponent < MainComponent
  attr_reader :user_signed_in

  def initialize(user_signed_in:)
    @user_signed_in = user_signed_in
  end
end
