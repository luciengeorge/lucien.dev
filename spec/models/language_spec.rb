require 'rails_helper'

RSpec.describe Language, type: :model do
  before(:each) do
    @language = create(:language)
  end

  describe '#repo_languages' do
    it 'should return all the instances linking the language to the repos' do
      expect(@language).to respond_to(:repo_languages)
    end
  end

  describe '#repos' do
    it 'should return all the repos using the language' do
      expect(@language).to respond_to(:repos)
    end
  end

  describe '#name' do
    it 'should have a name' do
      language = build(:language, name: nil)
      expect(language).to be_invalid
      expect(language.errors.messages.keys).to include(:name)
    end

    it 'should have a unique name' do
      language = build(:language)
      expect(language).to be_invalid
      expect(language.errors.messages.keys).to include(:name)
    end

    it 'should return a name' do
      expect(@language).to respond_to(:name)
    end
  end

  describe '#color' do
    it 'should have a color' do
      language = build(:language, color: nil)
      expect(language).to be_invalid
      expect(language.errors.messages.keys).to include(:color)
    end
  end
end
