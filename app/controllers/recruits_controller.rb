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
      redirect_to recruit_path(@recruit), notice: t("create.success")
    else
      render :new, alert: t("create.fail")
    end
  end

  def edit
    authorize @recruit
  end

  def update
    authorize @recruit
    if @recruit.update(recruit_params)
      redirect_to recruit_path(@recruit), notice: t("create.success")
    else
      render :edit, alert: t("create.fail")
    end
  end

  def destroy
    authorize @recruit
    if @recruit.destroy
      redirect_to band_path(@recruit.band), notice: t("delete.success")
    else
      redirect_to recruit_path(@recruit), alert: t("delete.fail")
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
