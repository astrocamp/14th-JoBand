# frozen_string_literal: true

class ResumeListsController < ApplicationController
  before_action :set_resume_list, only: %i[show edit update destroy approve reject]
  before_action :set_recruit, only: %i[new create]
  before_action :notice_as_read, only: %i[show]

  def show
    authorize @resume_list

    @comment = Comment.new
    @comments = @resume_list.comments.order(created_at: :desc)
  end

  def new
    if current_user.band_members.count >= 5
      flash[:alert] = t("check.max_bamnds")
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
      redirect_to resume_list_path(@resume_list), notice: t("apply.success")
    else
      render :new, alert:t("create.fail")
    end
  end

  def edit
    authorize @resume_list
    @recruit = @resume_list.recruit
  end

  def update
    authorize @resume_list
    if @resume_list.update(resume_list_params)
      redirect_to resume_list_path(@resume_list), notice: t("update.success")
    else
      render :edit
    end
  end

  def destroy
    @resume_list.destroy
    redirect_to recruit_path(@resume_list.recruit), notice: t("delete.success")
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
      redirect_to recruit_path(@recruit), notice: t("join.success")
    elsif @user.band_members.count >= 5
      redirect_to resume_list_path(@resume_list), alert: t("check.max_bands")
    else
      flash.now[:alert] = t("create.fail")
      redirect_to resume_list_path(@resume_list)
    end
  end

  def reject
    authorize @resume_list
    if @resume_list.update(status: :rejected)
      redirect_to recruit_path(@resume_list.recruit), notice: t("apply.fail")
    else
      reder resume_list_path(@resume_list), alert: t("check.fail")
    end
  end

  def notice_as_read
    if current_user == @resume_list.band_leader
      @notification = Notification.find_by("params->>'ResumeList'  = ?", "#{@resume_list.id}" )
      if @notification.present?
        @notification.update(read_at: Time.now)
      end
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
