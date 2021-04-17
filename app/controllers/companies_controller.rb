class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @companies = policy_scope(Company).order(:name)
    authorize current_user, policy_class: Company
  end

  def new
    skip_authorization
  end
end
