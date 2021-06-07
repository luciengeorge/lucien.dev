class Experience < ApplicationRecord
  belongs_to :company

  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validate :start_before_end_date

  enum job_type: %i[full_time part_time self_employed freelance contract internship apprenticeship temporary]

  private

  def start_before_end_date
    return if end_date.nil? || start_date.before?(end_date)

    errors.add(:end_date, "should be after the start date")
  end
end
