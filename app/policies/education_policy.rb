class EducationPolicy < ApplicationPolicy
  def create?
    user&.admin?
  end
end
