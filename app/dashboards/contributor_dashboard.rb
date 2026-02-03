require "administrate/base_dashboard"

class ContributorDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    repo_contributors: Field::HasMany,
    repos: Field::HasMany,
    commits: Field::HasMany,
    id: Field::Number,
    login: Field::String,
    gh_id: Field::Number,
    gh_type: Field::String,
    avatar_url: Field::String,
    api_url: Field::String,
    profile_url: Field::String,
    followers_url: Field::String,
    following_url: Field::String,
    starred_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    login
    gh_id
    gh_type
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    repo_contributors
    repos
    commits
    id
    login
    gh_id
    gh_type
    avatar_url
    api_url
    profile_url
    followers_url
    following_url
    starred_url
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    login
    gh_id
    gh_type
    avatar_url
    api_url
    profile_url
    followers_url
    following_url
    starred_url
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
