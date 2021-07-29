class Experience < ApplicationRecord
  belongs_to :company

  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validate :start_before_end_date

  after_create :update_ranks
  after_create :set_end_date_to_previous_experience

  enum job_type: %i[full_time part_time self_employed freelance contract internship apprenticeship temporary]

  private

  def start_before_end_date
    return if end_date.nil? || start_date.before?(end_date)

    errors.add(:end_date, "should be after the start date")
  end

  def update_ranks
    UpdateExperienceRankJob.perform_later
  end

  def set_end_date_to_previous_experience
    SetEndDateToPreviousExperienceJob.perform_later(self)
  end
end
