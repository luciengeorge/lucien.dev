class Education < ApplicationRecord
  belongs_to :school
  validates :degree, presence: true
  validates :start_date, presence: true
  has_rich_text :description
end
