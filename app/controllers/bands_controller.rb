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
        redirect_to band_path(@band), notice: '成功創立樂團'
      else
        flash.now[:alert] = '創建失敗，請檢查輸入。'
        render :new
      end
    else
      @band.errors.add(:base, '最多只能擁有5個樂團。')
      flash.now[:alert] = '最多只能擁有5個樂團。'
      render :new
    end
  end

  def edit
    authorize @band
  end

  def update
    authorize @band
    if @band.update(band_params)
      redirect_to band_path(@band), notice: '更新成功'
    else
      flash.now[:alert] = '更新失敗，請檢查輸入。'
      render :edit
    end
  end

  def mark_notice_as_read
    
    if @band.band_members.pluck(:user_id).include?current_user.id
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
