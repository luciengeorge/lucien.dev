require "administrate/base_dashboard"

class SchoolDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    city: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    city
    created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    city
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    city
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
