require "administrate/base_dashboard"

class ExperienceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    company: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    description: Field::RichText,
    start_date: Field::Date,
    end_date: Field::Date,
    job_type: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.job_types.keys }),
    rank: Field::Number,
    hidden: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    company
    start_date
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    company
    id
    title
    description
    start_date
    end_date
    job_type
    rank
    hidden
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    company
    title
    description
    start_date
    end_date
    job_type
    rank
    hidden
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
