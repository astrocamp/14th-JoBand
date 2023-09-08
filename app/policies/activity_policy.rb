class ActivityPolicy < ApplicationPolicy
  def initialize(user, activity)
    @user = user
    @activity = activity
  end

  def band_manager?
    manager.exists?(band_id: @activity.band.id)
  end

  def band_leader?
    leader.exists?(band_id: @activity.band.id)
  end

  def create?
    band_leader?
  end

  def new?
    create?
  end

  def update?
    band_leader? || band_manager?
  end

  def edit?
    update?
  end

  def destroy?
    create?
  end
end
