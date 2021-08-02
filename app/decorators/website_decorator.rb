class WebsiteDecorator < Draper::Decorator
  delegate_all

  def cover_url
    image_url || helpers.asset_path('website_default.png')
  end

  def short_description
    description.truncate(Website::MAX_CHARS)
  end
end
