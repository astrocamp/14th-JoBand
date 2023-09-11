# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update letsjam]
  before_action :set_profile, only: %i[edit update show]

  def index
    @search_profile = Profile.ransack(params[:q])
    @profiles = @search_profile.result(distinct: true)
  end

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = current_user.create_profile(params_profile)
    if @profile.save
      redirect_to profile_path(@profile), notice: '新增 profile 成功'
    else
      render :new
    end
  end

  def welcome; end

  def letsjam; end

  def show; end

  def edit
    authorize @profile
  end

  def update
    authorize @profile
    if @profile.update(params_profile)
      redirect_to profile_path(@profile), notice: '修改profile 成功'
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
end
