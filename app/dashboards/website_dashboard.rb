require "administrate/base_dashboard"

class WebsiteDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    repo: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    url: Field::String,
    image_url: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    url
    repo
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    repo
    id
    title
    url
    image_url
    description
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    repo
    title
    url
    image_url
    description
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
