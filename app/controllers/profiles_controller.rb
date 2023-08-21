# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[edit update show]

  def index
    @profiles = Profile.order(id: :desc)
  end

  def new
    @profile = Profile.new
    @instruments = Instrument.all
  end

  def create
    @profile = Profile.new(params_profile)
    if @profile.save
      redirect_to profiles_path, notice: '新增 profile 成功'
    else
      render :new
    end
  end

  def show; end

  def edit
    @instruments = Instrument.all
  end

  def update
    if @profile.update(params_profile)
      redirect_to profiles_path, notice: '新增 profile 成功'
    else
      render :edit
    end
  end

  private

  def params_profile
    params.require(:profile).permit(:name, :phone, :location, :seniority, :content, :avatar, :music, :video, instrument_ids: [])
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
