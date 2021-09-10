require 'rails_helper'

RSpec.describe Experience, type: :model do
  before(:each) do
    @company = create(:company)
    @experience = create(:experience, company: @company)
  end

  describe '#company' do
    it 'should have a company' do
      experience = build(:experience, company: nil)
      expect(experience).to be_invalid
      expect(experience.errors.messages.keys).to include(:company)
    end

    it "should return the experience's company" do
      expect(@experience).to respond_to(:company)
      expect(@experience.company).to eq(@company)
    end
  end

  describe '#description' do
    it 'should have a description' do
      experience = build(:experience, description: nil)
      expect(experience).to be_invalid
      expect(experience.errors.messages.keys).to include(:description)
    end

    it "should return the education's description" do
      expect(@experience).to respond_to(:description)
      expect(@experience.description).to be_an(ActionText::RichText)
    end
  end

  describe '#title' do
    it 'should have a title' do
      experience = build(:experience, title: nil)
      expect(experience).to be_invalid
      expect(experience.errors.messages.keys).to include(:title)
    end

    it "should return the experience's title" do
      expect(@experience).to respond_to(:title)
      expect(@experience.title).to eq('Co-Founder')
    end
  end

  describe '#start_date' do
    it 'should have a start_date' do
      experience = build(:experience, start_date: nil)
      expect(experience).to be_invalid
      expect(experience.errors.messages.keys).to include(:start_date)
    end

    it "should return the experience's start_date" do
      expect(@experience).to respond_to(:start_date)
      expect(@experience.start_date).to be_a(Date)
    end
  end

  describe '#end_date' do
    it "should have a start_date that is before the end_date" do
      experience = build(:experience, start_date: Time.zone.now, end_date: Time.zone.now - 1.day)
      expect(experience).to be_invalid
      expect(experience.errors.messages.keys).to include(:end_date)
    end

    it "should return the experience's end_date" do
      expect(@experience).to respond_to(:end_date)
      expect(@experience.end_date).to be_a(Date)
    end
  end

  describe '#rank' do
    it "should return the experience's rank" do
      expect(@experience).to respond_to(:rank)
      expect(@experience.rank).to be_an(Integer)
    end

    it "should update the rank after save" do
      expect { create(:experience) }.to have_enqueued_job(UpdateExperienceRankJob)
    end

    it "should update other experiences' ranks on update" do
      experience = create(:experience)
      expect { experience.update rank: 3 }.to have_enqueued_job(UpdateExperienceRankJob)
    end
  end
end
