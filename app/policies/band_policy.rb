class BandPolicy < ApplicationPolicy
  
  def initialize(user, band)
    @user = user
    @band = band
  end

  def manager? 
    @band.band_members.find_by(identity: :manager)&.user == user
  end

  def leader?
    @band.band_members.find_by(identity: :leader).user == user
  end

  def create?
    @user.profile.present?
  end

  def new?
    create?
  end

  def update?
    leader? || manager?
  end

  def edit
    update?
  end

end
