require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    admin: Field::Boolean,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    confirmation_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    unconfirmed_email: Field::String,
    remember_created_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    encrypted_password: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    email
    admin
    confirmed_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    admin
    confirmed_at
    confirmation_sent_at
    confirmation_token
    reset_password_sent_at
    reset_password_token
    unconfirmed_email
    remember_created_at
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    email
    admin
    confirmed_at
    unconfirmed_email
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
