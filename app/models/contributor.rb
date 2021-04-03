class Contributor < ApplicationRecord
  has_many :repo_contributors, dependent: :destroy
  has_many :repos, through: :repo_contributors
  has_many :commits, dependent: :destroy

  ME = 'lucien-george'.freeze
end
