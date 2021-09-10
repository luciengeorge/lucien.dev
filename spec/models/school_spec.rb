require 'rails_helper'

RSpec.describe School, type: :model do
  before(:each) do
    @school = create(:school)
  end

  describe '#name' do
    it 'should have a name' do
      school = build(:school, name: nil)
      expect(school).to be_invalid
      expect(school.errors.messages.keys).to include(:name)
    end

    it "should return the school's name" do
      expect(@school).to respond_to(:name)
      expect(@school.name).to be_a(String)
      expect(@school.name).to eq('McGill University')
    end
  end

  describe '#city' do
    it 'should have a city' do
      school = build(:school, city: nil)
      expect(school).to be_invalid
      expect(school.errors.messages.keys).to include(:city)
    end

    it "should return the school's city" do
      expect(@school).to respond_to(:city)
      expect(@school.city).to be_a(String)
      expect(@school.city).to eq('Montreal, Canada')
    end
  end
end
