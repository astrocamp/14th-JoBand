# frozen_string_literal: true

class ResumeListPolicy < ApplicationPolicy
  def initialize(user, resume_list)
    @user = user
    @resume_list = resume_list
  end

  def repeat?
    !user.resume_lists&.exists?(recruit: @resume_list.recruit)
  end

  def member?
    !@resume_list.recruit.band.band_members.exists?(user_id: @user.id)
  end

  def band_manager?
    manager.exists?(band_id: @resume_list.recruit.band.id)
  end

  def band_leader?
    leader.exists?(band_id: @resume_list.recruit.band.id)
  end

  def resume_list_owner?
    @resume_list.user == user
  end

  def approve?
    band_leader?
  end

  def reject?
    approve?
  end

  def show?
    resume_list_owner? || band_leader? || band_manager?
  end

  def create?
    user&.profile.present? && member? && repeat?
  end

  def new?
    create?
  end

  def update?
    resume_list_owner?
  end

  def edit?
    update?
  end

  def destroy?
    create?
  end
end
