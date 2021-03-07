class ProjectsController < ApplicationController
  def index
    @pagy, @repos = pagy_array($octokit.repos)
  end
end
