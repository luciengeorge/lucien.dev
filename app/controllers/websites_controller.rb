class WebsitesController < ApplicationController
  def new
    @website = Website.new
    authorize @website
  end

  def create
    @website = Website.new(website_params)
    authorize @website
    if @website.save
      redirect_to new_website_path
    else
      render :new
    end
  end

  private

  def website_params
    params.require(:website).permit(:url, :repo_id)
  end
end
