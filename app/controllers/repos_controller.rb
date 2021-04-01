class ReposController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @repos = pagy(policy_scope(Repo).includes(:repo_languages))
  end
end
