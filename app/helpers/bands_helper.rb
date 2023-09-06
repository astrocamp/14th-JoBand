# frozen_string_literal: true

module BandsHelper
  def band_leader
    @band.band_members.find_by(identity: :leader).user
  end

  def band_manager
    @band.band_members.find_by(identity: :manager)&.user
  end
end
