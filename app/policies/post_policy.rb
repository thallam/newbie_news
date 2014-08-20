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

def destroy?
  user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
end
end
