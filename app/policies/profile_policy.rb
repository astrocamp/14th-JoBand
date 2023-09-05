class ProfilePolicy < ApplicationPolicy

  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def owner?
    user.profile == @profile
  end

  def profile?
    user.profile.present? && owner?
  end

  def index?
    false
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user && owner?
  end

  def edit?
    update?
  end



end
