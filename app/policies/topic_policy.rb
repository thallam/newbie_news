class TopicPolicy < ApplicationPolicy
def index?
  true
end

def update?
user.present? &&  user.role?(:admin)
end
end
