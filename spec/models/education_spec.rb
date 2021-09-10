require 'rails_helper'

RSpec.describe Education, type: :model do
  before(:each) do
    @education = create(:education)
  end

  describe '#school' do
    it 'should have a school' do
      education = build(:education, school: nil)
      expect(education).to be_invalid
      expect(education.errors.messages.keys).to include(:school)
    end

    it "should return the education's school" do
      expect(@education).to respond_to(:school)
      expect(@education.school).to be_a(School)
    end
  end

  describe '#degree' do
    it 'should have a degree' do
      education = build(:education, degree: nil)
      expect(education).to be_invalid
      expect(education.errors.messages.keys).to include(:degree)
    end

    it "should return the education's degree" do
      expect(@education).to respond_to(:degree)
      expect(@education.degree).to be_a(String)
      expect(@education.degree).to eq('BEng. Software Engineering')
    end
  end

  describe '#start_date' do
    it 'should have a start_date' do
      education = build(:education, start_date: nil)
      expect(education).to be_invalid
      expect(education.errors.messages.keys).to include(:start_date)
    end

    it "should return the education's start_date" do
      expect(@education).to respond_to(:start_date)
      expect(@education.start_date).to be_a(Date)
    end
  end

  describe '#description' do
    it "should return the education's description" do
      expect(@education).to respond_to(:description)
      expect(@education.description).to be_an(ActionText::RichText)
    end
  end
end
