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
    # @activities = Activity.order(id: :desc)
    @search_activity = Activity.ransack(params[:q])
    @activities = @search_activity.result(distinct: true)
  end

  def show
    @band = @activity.band
    @comment = Comment.new
    @comments = @activity.comments.order(created_at: :desc)
  end

  def new
    @activity = Activity.new(band: @band)
    authorize @activity
  end

  def create
    @activity = @band.activities.build(activity_params)
    authorize @activity
    if @activity.save
      redirect_to activity_path(@activity), notice: t("create.success")
    else
      render :new, alert: t("create.fail")
    end
  end

  def edit
    authorize @activity
  end

  def update
    authorize @activity
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: t("delete.success")
    else
      render :edit, alert: t("update.fail")
    end
  end

  def destroy
    authorize @activity
    @activity.destroy
    redirect_to band_path(@activity.band), notice: t("delete.success")
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
