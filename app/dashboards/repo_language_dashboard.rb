require "administrate/base_dashboard"

class RepoLanguageDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    repo: Field::BelongsTo,
    language: Field::BelongsTo,
    id: Field::Number,
    size: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    repo
    language
    size
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    repo
    language
    id
    size
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    repo
    language
    size
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
