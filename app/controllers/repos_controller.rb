class ReposController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @repos = pagy(policy_scope(Repo).includes(:repo_languages, :languages, :contributors, :repo_contributors)
                                           .left_outer_joins(:contributors)
                                           .where.not('full_name LIKE ? and private = ?', 'lewagon%', true)
                                           .where(contributors: { login: Contributor::ME }).order(pushed_at: :desc))
    respond_to do |format|
      format.html
      format.json do
        render json: {
          entries: render_to_string(Repos::ListComponent.new(repos: @repos)),
          pagination: view_context.pagy_nav(@pagy)
        }
      end
    end
  rescue Pagy::OverflowError => e
    redirect_to repos_path(page: 1), alert: "Page #{e.message.split('got').last.strip} doesn't exist"
  end
end
