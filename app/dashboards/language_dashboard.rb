require "administrate/base_dashboard"

class LanguageDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    repo_languages: Field::HasMany,
    repos: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    color: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    color
    repos
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    repo_languages
    repos
    id
    name
    color
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    color
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
