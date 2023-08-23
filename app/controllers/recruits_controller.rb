# frozen_string_literal: true

class RecruitsController < ApplicationController
  before_action :set_recruit, only: %i[edit update show destroy]
  def index
    @recruits = Recruit.order(id: :desc)
  end

  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(recruit_params)
    if @recruit.save
      redirect_to recruit_path(@recruit), notice: '招募創建成功'
    else
      render :new, notice: '創建失敗'
    end
  end

  def edit; end

  def update
    if @recruit.update(recruit_params)
      redirect_to recruit_path(@recruit), notice: '招募更新成功'
    else
      render :edit, notice: '招募更新失敗'
    end
  end

  def destroy
    @recruit.destroy
    redirect_to recruits_path, notice: '刪除成功'
  end

  def show; end

  private

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  def recruit_params
    params.require(:recruit).permit(:recruit_title, :condition, :practice_time, :area, instrument_ids: [])
  end
end
