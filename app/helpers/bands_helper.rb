# frozen_string_literal: true

module BandsHelper
  def bnad_leader
    @band.band_members.find_by(identity: :leader).user
  end

  def bnad_manager
    @band.band_members.find_by(identity: :manager)&.user
  end
end
