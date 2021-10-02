require "rails_helper"

RSpec.describe Experiences::DownloadComponent, type: :component do
  before(:each) do
    create(:experience, hidden: false)
    create(:education)
    @experiences = Experience.where(hidden: false)
    @educations = Education.all
    @spoken_languages = Experience::SPOKEN_LANGUAGES
    @programming_languages = Experience::PROGRAMMING_LANGUAGES
    ActiveStorage::Attached::One.define_method(:url) { 'https://picsum.photos/200' }
  end

  it "renders my name" do
    expect(
      render_inline(described_class.new(experiences: @experiences, programming_languages: @programming_languages, spoken_languages: @spoken_languages, educations: @educations, download: true)).to_html
    ).to include(
      "Lucien George"
    )
  end

  it "renders the contact info" do
    expect(
      render_inline(described_class.new(experiences: @experiences, programming_languages: @programming_languages, spoken_languages: @spoken_languages, educations: @educations, download: true)).to_html
    ).to include(
      "Contact"
    )
  end

  it "renders the programming languages" do
    expect(
      render_inline(described_class.new(experiences: @experiences, programming_languages: @programming_languages, spoken_languages: @spoken_languages, educations: @educations, download: true)).to_html
    ).to include(
      Experience::PROGRAMMING_LANGUAGES.first
    )
  end

  it "renders the spoken languages" do
    expect(
      render_inline(described_class.new(experiences: @experiences, programming_languages: @programming_languages, spoken_languages: @spoken_languages, educations: @educations, download: true)).to_html
    ).to include(
      Experience::SPOKEN_LANGUAGES.first
    )
  end

  it "renders the experiences" do
    expect(
      render_inline(described_class.new(experiences: @experiences, programming_languages: @programming_languages, spoken_languages: @spoken_languages, educations: @educations, download: true)).to_html
    ).to include(
      Experience.last.title
    )
  end
end
