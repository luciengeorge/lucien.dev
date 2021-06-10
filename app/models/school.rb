class School < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
end
