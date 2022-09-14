class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :store_user_location!, if: :storable_location?
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  include Pundit
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :not_found
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from AbstractController::ActionNotFound, with: :not_found

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def not_found
    respond_to do |format|
      format.html { render_not_found_template }
      format.json { render json: { error: true, status: 404, message: 'Not Found' } }
    end
  rescue ActionController::UnknownFormat
    render_not_found_template
  end

  def render_not_found_template
    render file: Rails.root.join('public', '404.html'), status: :not_found, layout: false
  end
end
