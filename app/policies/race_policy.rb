class RacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def edit?
    return true
    # record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
