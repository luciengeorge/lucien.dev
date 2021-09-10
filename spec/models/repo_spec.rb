require 'rails_helper'

RSpec.describe Repo, type: :model do
  before(:each) do
    @repo = create(:repo)
  end

  it "should have a name" do
    repo = build(:repo, name: nil)
    expect(repo).to be_invalid
    expect(repo.errors.messages.keys).to include(:name)
  end

  it "should have a gh_id" do
    repo = build(:repo, gh_id: nil)
    expect(repo).to be_invalid
    expect(repo.errors.messages.keys).to include(:gh_id)
  end

  it "should have a unique gh_id" do
    repo = build(:repo)
    expect(repo).to be_invalid
    expect(repo.errors.messages.keys).to include(:gh_id)
  end

  it "should have a unique full_name" do
    repo = build(:repo)
    expect(repo).to be_invalid
    expect(repo.errors.messages.keys).to include(:full_name)
  end

  it "should store infos about the owner" do
    expect(@repo.owner).to be_a(Hash)
  end

  describe '#owner_login' do
    it "should return the login of the repo owner" do
      expect(@repo).to respond_to(:owner_login)
    end
  end

  describe '#owner_id' do
    it 'should return the id of the repo owner' do
      expect(@repo).to respond_to(:owner_id)
    end
  end

  describe '#owner_avatar_url' do
    it 'should return the avatar url of the owner' do
      expect(@repo).to respond_to(:owner_avatar_url)
    end
  end

  describe '#owner_html_url' do
    it "should return the url of the owner's profile" do
      expect(@repo).to respond_to(:owner_html_url)
    end
  end

  describe '#owner_type' do
    it 'should return the type of the owner' do
      expect(@repo).to respond_to(:owner_type)
    end
  end

  describe '#language' do
    it 'should return the most used language of a repo' do
      ruby = create(:language)
      js = create(:language, name: 'JavaScript', color: '#f1e05a')
      create(:repo_language, language: ruby, repo: @repo)
      create(:repo_language, language: js, repo: @repo, size: 500)
      expect(@repo.language).to eq(ruby)
    end

    it 'should return nil if there are no languages' do
      expect(@repo.language).to be(nil)
    end
  end

  describe '#contributors' do
    it "should return a collection of all the repo's contributors" do
      expect(@repo).to respond_to(:contributors)
    end
  end

  describe '#languages' do
    it "should return a collection of all the languages used in a repo" do
      expect(@repo).to respond_to(:languages)
    end
  end

  describe '#commits' do
    it "should return a collection of all the repo's commits" do
      expect(@repo).to respond_to(:commits)
    end
  end

  describe '#commits_url' do
    it "should return the repo's commits url" do
      expect(@repo).to respond_to(:commits_url)
      expect(@repo.commits_url).to match(/\/commits/)
    end
  end

  describe '#empty?' do
    it 'should return true if there are no contributors' do
      expect(@repo.empty?).to eq(true)
    end
  end
end
