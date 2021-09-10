require 'rails_helper'

RSpec.describe Contributor, type: :model do
  before(:each) do
    @contributor = create(:contributor)
  end

  describe '#repo_contributors' do
    it "should return a collection of repo_contributors" do
      expect(@contributor).to respond_to(:repo_contributors)
    end
  end

  describe '#repos' do
    it "should return a collection of repos" do
      expect(@contributor).to respond_to(:repos)
    end
  end

  describe '#commits' do
    it "should return a collection of commits" do
      expect(@contributor).to respond_to(:commits)
    end
  end
end
