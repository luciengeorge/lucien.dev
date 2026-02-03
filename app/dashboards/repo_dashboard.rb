require "administrate/base_dashboard"

class RepoDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    repo_contributors: Field::HasMany,
    contributors: Field::HasMany,
    repo_languages: Field::HasMany,
    languages: Field::HasMany,
    commits: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    full_name: Field::String,
    gh_id: Field::Number,
    api_url: Field::String,
    git_url: Field::String,
    html_url: Field::String,
    homepage: Field::String,
    owner: Field::Text,
    fork: Field::Boolean,
    private: Field::Boolean,
    forks: Field::Number,
    stars: Field::Number,
    open_issues: Field::Number,
    size: Field::Number,
    commits_count: Field::Number,
    pushed_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    full_name
    gh_id
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    repo_contributors
    contributors
    repo_languages
    languages
    commits
    id
    name
    full_name
    gh_id
    api_url
    git_url
    html_url
    homepage
    owner
    fork
    private
    forks
    stars
    open_issues
    size
    commits_count
    pushed_at
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    full_name
    gh_id
    api_url
    git_url
    html_url
    homepage
    owner
    fork
    private
    forks
    stars
    open_issues
    size
    commits_count
    pushed_at
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
