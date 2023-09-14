# frozen_string_literal: true

class ResumeListsController < ApplicationController
  before_action :set_resume_list, only: %i[show edit update destroy approve reject]
  before_action :set_recruit, only: %i[new create]

  def show
    authorize @resume_list
    if current_user == @band_leader
      notice_as_read()
    end
    @comment = Comment.new
    @comments = @resume_list.comments.order(created_at: :desc)
  end

  def new
    if current_user.band_members.count >= 5
      flash[:alert] = '最多只能擁有5個樂團。'
      redirect_to recruit_path(@recruit)
    else
      @resume_list = ResumeList.new(recruit: @recruit)
      authorize @resume_list
    end
  end

  def create
    @resume_list = @recruit.resume_lists.build(resume_list_params)
    authorize @resume_list
    if @resume_list.save
      redirect_to resume_list_path(@resume_list), notice: '申請成功'
    else
      render :new, alert:'失敗'
    end
  end

  def edit
    authorize @resume_list
    @recruit = @resume_list.recruit
  end

  def update
    authorize @resume_list
    if @resume_list.update(resume_list_params)
      redirect_to resume_list_path(@resume_list), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @resume_list.destroy
    redirect_to recruit_path(@resume_list.recruit), notice: '已刪除'
  end

  def approve
    authorize @resume_list
    @recruit = @resume_list.recruit
    @band = @recruit.band
    @role = @resume_list.role
    @user = @resume_list.user
    new_band_member = @band.band_members.new(user: @user, identity: :member, role: @role)
    if @user.band_members.count < 5
      new_band_member.save
      @resume_list.update(status: :approved)
      redirect_to recruit_path(@recruit), notice: '已加入樂團'
    elsif @user.band_members.count >= 5
      redirect_to resume_list_path(@resume_list), alert: '此用戶樂團數量已達上限'
    else
      flash.now[:alert] = '加入失敗'
      redirect_to resume_list_path(@resume_list)
    end
  end

  def reject
    authorize @resume_list
    if @resume_list.update(status: :rejected)
      redirect_to recruit_path(@resume_list.recruit), notice: '已拒絕申請'
    else
      reder resume_list_path(@resume_list), alert: '操作失敗'
    end
  end

  def notice_as_read
    @notification = Notification.find_by(recipient_id: current_user.id)
    if @notification.present?
      @notification.update(read_at: Time.now)
    end
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:recruit_id])
  end

  def set_resume_list
    @resume_list = ResumeList.find(params[:id])
  end

  def resume_list_params
    params.require(:resume_list).permit(:user_id, :description, :role, :status)
  end
end
