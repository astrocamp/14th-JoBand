class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = Activity.order(id: :desc)
  end
    
  def new
    @activity = Activity.new
  end

  def show; end
    
  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to activity_path(@activity), notice: '成功建立活動'
    else
      render :new, notice: '建立失敗'
    end
  end

  def edit; end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: '更新成功'
    else
      render :edit, notice: '更新失敗'
    end
  end 

  def destroy
    @activity.destroy
    redirect_to activities_path, notice: '刪除成功'
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :content, :founded_at, :location, :banner)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
