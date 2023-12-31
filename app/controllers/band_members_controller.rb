# frozen_string_literal: true

class BandMembersController < ApplicationController
  before_action :set_band_member, only: %i[edit update destroy]
  before_action :set_band, only: %i[edit update]

  def edit; end

  def update
    if @band_member.update(band_member_params)
      redirect_to band_path(@band)
    else
      render :edit, notice: '失敗'
    end
  end

  def destroy
    @band_members.destroy
    redirect_to band_path(@band_members.band)
  end

  private

  def set_band
    @band = Band.friendly.find(params[:band_slug])
  end

  def set_band_member
    @band_member = BandMember.find(params[:id])
  end

  def band_member_params
    params.require(:band_member).permit(:role, :identity)
  end
end
