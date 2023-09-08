# frozen_string_literal: true

class RecruitsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_band_id, only: %i[new create]
  before_action :set_recruit, only: %i[edit update show destroy]

  def new
    @recruit = Recruit.new(band: @band)
    authorize @recruit
  end

  def create
    @recruit = @band.build_recruit(recruit_params)
    authorize @recruit
    if @recruit.save
      redirect_to recruit_path(@recruit), notice: '招募創建成功'
    else
      render :new, alert: '創建失敗'
    end
  end

  def edit
    authorize @recruit
  end

  def update
    authorize @recruit
    if @recruit.update(recruit_params)
      redirect_to recruit_path(@recruit), notice: '招募更新成功'
    else
      render :edit, alert: '招募更新失敗'
    end
  end

  def destroy
    authorize @recruit
    if @recruit.destroy
      redirect_to band_path(@recruit.band), notice: '刪除成功'
    else
      redirect_to recruit_path(@recruit), alert: '刪除失敗'
    end
  end

  def show
    @resume_lists = @recruit.resume_lists
  end

  private

  def set_band_id
    @band = Band.friendly.find(params[:band_slug])
  end

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  def recruit_params
    params.require(:recruit).permit(:title, :condition, :practice_time, :area, instrument_ids: [])
  end
end
