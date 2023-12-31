# frozen_string_literal: true

class RecruitPolicy < ApplicationPolicy
  def initialize(user, recruit)
    @user = user
    @recruit = recruit
  end

  def apply?
    user &&
      !user.band_members.exists?(band_id: @recruit.band.id) &&
      !user.resume_lists.exists?(recruit_id: @recruit.id)
  end

  def band_manager?
    user && manager.exists?(band_id: @recruit.band.id)
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
    band_leader? || band_manager?
  end

  def edit?
    update?
  end

  def destroy?
    create?
  end
end
