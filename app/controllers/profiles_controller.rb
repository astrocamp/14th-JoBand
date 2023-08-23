# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[edit update show]
  before_action :set_user, only: %i[show]

  def index
    @p = Profile.ransack(params[:q])
    @profiles = @p.result(distinct: true)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.create_profile(params_profile)
    if @profile.save
      redirect_to profile_path(@profile), notice: '新增 profile 成功'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @profile.update(params_profile)
      redirect_to profiles_path(@profile), notice: '新增 profile 成功'
    else
      render :edit
    end
  end

  private

  def params_profile
    params.require(:profile).permit(:name, :phone, :location, :seniority, :content, :avatar, :music, :video,
                                    instrument_ids: [])
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
