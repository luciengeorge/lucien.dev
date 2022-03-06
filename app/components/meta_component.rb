# frozen_string_literal: true

class MetaComponent < ViewComponent::Base
  delegate :csrf_meta_tags, to: :helpers
  delegate :csp_meta_tag, to: :helpers
  delegate :favicon_link_tag, to: :helpers
  delegate :meta_image, to: :helpers
  delegate :meta_title, to: :helpers
  delegate :meta_description, to: :helpers
end
