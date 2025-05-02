require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:each) do
    @company = create(:company)
  end

  describe '#website' do
    it 'should have a website' do
      website = build(:company, website: nil)
      expect(website).to be_invalid
      expect(website.errors.messages.keys).to include(:website)
    end

    it "should return the company's website" do
      expect(@company).to respond_to(:website)
      expect(@company.website).to eq('www.lucien.dev')
    end
  end

  describe '#photo' do
    it "should return the company's photo" do
      expect(@company).to respond_to(:photo)
    end
  end

  describe '#address' do
    it 'should have an address' do
      company = build(:company, address: nil)
      expect(company).to be_invalid
      expect(company.errors.messages.keys).to include(:address)
    end

    it "should return the company's address" do
      expect(@company).to respond_to(:address)
      expect(@company.address).to eq('116 Cromwell Road, London, UK')
    end

    it 'should be geocoded on create' do
      expect(@company.latitude).to_not be(nil)
      expect(@company.longitude).to_not be(nil)
    end

    describe '#url' do
      it "should return the company's url" do
        expect(@company).to respond_to(:url)
        expect(@company.url).to match(/http:\/\//)
      end
    end
  end
end
