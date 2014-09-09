class TopicPolicy < ApplicationPolicy

def show?
  record.public? || user.present?
end
def index?
  true
end

def update?
user.present? &&  user.role?(:admin)
end

def create?
update?
end
end
