require 'rails_helper'

RSpec.describe RepoLanguage, type: :model do
  before(:each) do
    @language = create(:language)
    @repo = create(:repo)
  end

  describe '#language' do
    it 'should have a language' do
      repo_language = build(:repo_language, repo: @repo, language: nil)
      expect(repo_language).to be_invalid
      expect(repo_language.errors.messages.keys).to include(:language)
    end

    it 'should return the language it is associated to' do
      repo_language = create(:repo_language, repo: @repo, language: @language)
      expect(repo_language).to respond_to(:language)
      expect(repo_language.language).to eq(@language)
    end
  end

  describe '#repo' do
    it 'should have a repo' do
      repo_language = build(:repo_language, repo: nil, language: @language)
      expect(repo_language).to be_invalid
      expect(repo_language.errors.messages.keys).to include(:repo)
    end

    it 'should return the repo it is associated to' do
      repo_language = create(:repo_language, repo: @repo, language: @language)
      expect(repo_language).to respond_to(:repo)
      expect(repo_language.repo).to eq(@repo)
    end
  end
end
