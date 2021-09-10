require 'rails_helper'

RSpec.describe Website, type: :model do
  before(:each) do
    @website = create(:website)
  end

  describe '#repo' do
    it "should return the website's repo" do
      expect(@website).to respond_to(:repo)
      expect(@website.repo).to be_a(Repo)
    end
  end

  describe '#url' do
    it "should have a valid url" do
      expect(@website.url).to match(URI::DEFAULT_PARSER.make_regexp)
    end

    it "should return the website's url" do
      expect(@website).to respond_to(:url)
    end
  end

  describe '#title' do
    it "should return the website's title" do
      expect(@website).to respond_to(:title)
    end
  end

  describe '#description' do
    it "should return the website's description" do
      expect(@website).to respond_to(:description)
    end
  end

  describe '#image_url' do
    it "should return the website's image_url" do
      expect(@website).to respond_to(:image_url)
    end
  end
end
