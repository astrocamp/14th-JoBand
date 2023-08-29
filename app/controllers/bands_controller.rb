# frozen_string_literal: true

class BandsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_band, only: %i[show edit update]

  def index
    @search_band = Band.ransack(params[:q])
    @bands = @search_band.result(distinct: true)
  end

  def show
    @band_members = @band.band_members
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params.except(:role))
    @role = band_params[:role]
    if @band.save
      @band.band_members.create(user: current_user, identity: :leader, role: @role)
      redirect_to band_path(@band), notice: '成功創立樂團'
    else
      render :new, notice: '失敗'
    end
  end

  def edit; end

  def update
    if @band.update(band_params)
      redirect_to band_path(@band), notice: '更新成功'
    else
      render :edit, notice: '失敗'
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :content, :area, :state, :founded_at, :avatar, :music, :video, :banner, :role,
                                 style_ids: [])
  end
end
