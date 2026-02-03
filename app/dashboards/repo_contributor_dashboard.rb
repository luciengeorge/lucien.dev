require "administrate/base_dashboard"

class RepoContributorDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    repo: Field::BelongsTo,
    contributor: Field::BelongsTo,
    id: Field::Number,
    contribution_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    repo
    contributor
    contribution_count
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    repo
    contributor
    id
    contribution_count
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    repo
    contributor
    contribution_count
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
