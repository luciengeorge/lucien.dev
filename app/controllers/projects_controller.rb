class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @repos = pagy_array(Repo.all)
  end
end
