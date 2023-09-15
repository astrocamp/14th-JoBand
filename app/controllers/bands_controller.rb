# frozen_string_literal: true

class BandsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_band, only: %i[show edit update]
  # after_action :create_channel, only: %i[create]
  before_action :mark_notice_as_read, only: %i[show]

  def index
    @search_band = Band.ransack(params[:q])
    @bands = @search_band.result(distinct: true)
  end

  def show
    @band_members = @band.band_members
  end

  def new
    @band = Band.new
    authorize @band
  end

  def create
    @band = Band.new(band_params.except(:role))
    @role = band_params[:role]
    @user = current_user
    
    authorize @band
    if @user.band_members.count < 5
      if @band.save
        @band.band_members.create(user: @user, identity: :leader, role: @role)
        @band.create_channel(user: @user)
        redirect_to band_path(@band), notice: t("create.success")
      else
        flash.now[:alert] = t("create.fail")
        render :new
      end
    else
      @band.errors.add(:base, t("check.success"))
      flash.now[:alert] = t("check.success")
      render :new
    end
  end

  def edit
    authorize @band
  end

  def update
    authorize @band
    if @band.update(band_params)
      redirect_to band_path(@band), notice: t("update.success")
    else
      flash.now[:alert] = t("update.fail")
      render :edit
    end
  end

  def mark_notice_as_read
    
    if @band.band_members.pluck(:user_id).include?current_user&.id
      @notification = Notification.find_by(recipient_id: current_user.id)
      if @notification.present?
        @notification.update(read_at: Time.now)
      end
    end
  end

  private

  def set_band
    @band = Band.friendly.find(params[:slug])
  end

  def band_params
    params.require(:band).permit(:name, :content, :area, :state, :founded_at, :avatar, :music, :video, :banner, :role,
                                 style_ids: [])
  end

  def create_channel
    @band.create_channel(user: @user)
  end
end
