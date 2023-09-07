class RecruitPolicy < ApplicationPolicy
  
  def initialize(user, recruit)
    @user = user
    @recruit = recruit
  end

  def band_leader?
    user && leader.exists?(band_id: @recruit.band.id)
  end

  def create?
    band_leader?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    create?
  end

end
