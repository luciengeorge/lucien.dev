require "administrate/base_dashboard"

class CompanyDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    experiences: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    website: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    website
    created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    experiences
    id
    name
    address
    website
    latitude
    longitude
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    address
    website
    latitude
    longitude
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
