require "administrate/base_dashboard"

class CommitDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    contributor: Field::BelongsTo,
    repo: Field::BelongsTo,
    id: Field::Number,
    html_url: Field::String,
    message: Field::Text,
    pushed_at: Field::DateTime,
    sha: Field::String,
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    sha
    repo
    contributor
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    contributor
    repo
    id
    html_url
    message
    pushed_at
    sha
    url
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    contributor
    repo
    html_url
    message
    pushed_at
    sha
    url
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
