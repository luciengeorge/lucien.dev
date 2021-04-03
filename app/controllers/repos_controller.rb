class ReposController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @repos = pagy(policy_scope(Repo).includes(:repo_languages, :languages, :contributors, :repo_contributors)
                                           .left_outer_joins(:contributors)
                                           .where.not('full_name LIKE ? and private = ?', 'lewagon%', true)
                                           .where(contributors: { login: Contributor::ME }).order(pushed_at: :desc))
    @repos = @repos.uniq
  end
end
