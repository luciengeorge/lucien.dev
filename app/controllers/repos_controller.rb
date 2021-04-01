class ReposController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @repos = pagy_array(policy_scope(Repo))
  end
end
