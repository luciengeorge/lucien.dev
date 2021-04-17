class Experience < ApplicationRecord
  validates :start_date, presence: true
  belongs_to :company
  has_rich_text :experience
  validate :start_before_end_date

  private

  def start_before_end_date
    return if end_date.nil? || start_date.before? end_date

    errors.add(:end_date, "should be after the start date")
  end
end
