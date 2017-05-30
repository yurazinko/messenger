class ConversationPolicy < ApplicationPolicy
  def index?
    associated_user?
  end

  def show?
    associated_user?
  end

  def create?
    true
  end

  def update?
    associated_user?
  end

  def destroy?
    associated_user?
  end

  private

  def associated_user?
    @user.id == @record.user_id
  end
end
