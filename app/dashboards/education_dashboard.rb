require "administrate/base_dashboard"

class EducationDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    school: Field::BelongsTo,
    id: Field::Number,
    degree: Field::String,
    start_date: Field::Date,
    end_date: Field::Date,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    degree
    school
    start_date
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    school
    id
    degree
    start_date
    end_date
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    school
    degree
    start_date
    end_date
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
