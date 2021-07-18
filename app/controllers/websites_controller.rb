class WebsitesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @websites = policy_scope(Website).in_groups_of(Website::CHUNKS, false)
    raise
  end

  def new
    @website = Website.new
    @repos = Repo.order(:name)
    authorize @website
  end

  def create
    @website = Website.new(website_params)
    authorize @website
    if @website.save
      redirect_to new_website_path, notice: "#{@website.title} successfully created"
    else
      render :new
    end
  end

  private

  def website_params
    params.require(:website).permit(:url, :repo_id)
  end
end
