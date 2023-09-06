# frozen_string_literal: true

class BandPolicy < ApplicationPolicy
  def initialize(user, band)
    @user = user
    @band = band
  end

  def band_manager?
    manager.exists?(band_id: @band.id)
  end

  def band_leader?
    leader.exists?(band_id: @band.id)
  end

  def create?
    @user.profile.present?
  end

  def new?
    create?
  end

  def update?
    band_leader? || band_manager?
  end

  def edit
    update?
  end
end
