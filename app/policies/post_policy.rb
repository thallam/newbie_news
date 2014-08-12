class PostPolicy < ApplicationPolicy
def index?
  true
end


def create?
user.present? && user.role?(:admin || :user)
end

  def update?
create?
  end
end
