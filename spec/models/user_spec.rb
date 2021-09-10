require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email' do
    it "should have an email" do
      user = build(:user, email: nil)
      expect(user).to be_invalid
      expect(user.errors.messages.keys).to include(:email)
    end

    it "should return the user's email" do
      user = create(:user)
      expect(user).to respond_to(:email)
      expect(user.email).to match(User.email_regexp)
    end
  end
end
