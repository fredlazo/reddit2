
class TopicPolicy < ApplicationPolicy

  def new?
    user.admin?
  end

  def edit?
    user.admin? || record.user_id == user.id
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def delete?
    user.admin?
  end

end
