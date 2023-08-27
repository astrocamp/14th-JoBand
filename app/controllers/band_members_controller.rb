# frozen_string_literal: true

class BandMembersController < ApplicationController
  before_action :set_band_member, only: %i[edit update index destroy]
  before_action :set_band_id, only: %i[edit update]

  def edit; end

  def update
    if @band_members.update(band_member_params)
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

  def set_band_id
    @band = Band.find(params[:band_id])
  end

  def set_band_member
    @band_members = BandMember.find(params[:id])
  end

  def band_member_params
    params.require(:band_member).permit(:role, :identity)
  end
end
