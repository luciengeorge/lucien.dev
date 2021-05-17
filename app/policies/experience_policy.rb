class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    admin?
  end

  private

  def admin?
    user&.admin?
  end
end
