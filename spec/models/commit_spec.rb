require 'rails_helper'

RSpec.describe Commit, type: :model do
  before(:each) do
    @repo = create(:repo)
    @contributor = create(:contributor)
    @commit = create(:commit, repo: @repo, contributor: @contributor)
  end

  describe '#contributor' do
    it 'should return the author of the commit' do
      expect(@commit).to respond_to(:contributor)
      expect(@commit.contributor).to eq(@contributor)
    end
  end

  describe '#repo' do
    it 'should return the repo of the commit' do
      expect(@commit).to respond_to(:repo)
      expect(@commit.repo).to eq(@repo)
    end
  end

  describe '#sha' do
    it 'should have a sha' do
      commit = build(:commit, sha: nil)
      expect(commit).to be_invalid
      expect(commit.errors.messages.keys).to include(:sha)
    end

    it 'should have a unique sha' do
      commit = build(:commit, sha: @commit.sha)
      expect(commit).to be_invalid
      expect(commit.errors.messages.keys).to include(:sha)
    end

    it "should return the commit's sha" do
      expect(@commit).to respond_to(:sha)
      expect(@commit.sha).to_not be(nil)
      expect(@commit.sha).to be_a(String)
    end
  end

  describe '#url' do
    it 'should have a url' do
      commit = build(:commit, url: nil)
      expect(commit).to be_invalid
      expect(commit.errors.messages.keys).to include(:url)
    end

    it "should return the commit's url" do
      expect(@commit).to respond_to(:url)
      expect(@commit.url).to_not be(nil)
      expect(@commit.url).to be_a(String)
    end
  end

  describe '#html_url' do
    it 'should have a html_url' do
      commit = build(:commit, html_url: nil)
      expect(commit).to be_invalid
      expect(commit.errors.messages.keys).to include(:html_url)
    end

    it "should return the commit's html_url" do
      expect(@commit).to respond_to(:html_url)
      expect(@commit.html_url).to_not be(nil)
      expect(@commit.html_url).to be_a(String)
    end
  end
end
