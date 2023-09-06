# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_band, only: %i[new create]
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @band = Band.find_by(slug: params[:band_slug]) 
    @activities = @band.activities.order(id: :desc)
  end

  def activity_index
    # if 
    #   @activity = Activity.find(params[:id])
    # else
      @activities = Activity.order(id: :desc)
    # end
  end

  def new
    @activity = Activity.new
  end

  def show
    @band = @activity.band
  end

  def create
    @activity = @band.activities.build(activity_params)

    if @activity.save
      redirect_to activity_path(@activity), notice: '成功建立活動'
    else
      render :new, alert: '建立失敗'
    end
  end

  def edit; end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: '更新成功'
    else
      render :edit, alert: '更新失敗'
    end
  end

  def destroy
    @activity.destroy
    redirect_to band_path(@activity.band), notice: '刪除成功'
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :content, :begin_at, :time_start, :time_end, :location, :banner, :city)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_band
    @band = Band.friendly.find(params[:band_slug])
  end
end
