class ResumeListsController < ApplicationController
  before_action :set_recruit_id,  only: %i[new create]
  before_action :set_resume_list, only: %i[show edit update destroy approve]

  def show; end

  def new
    @resume_list = ResumeList.new
  end

  def create
    @resume_list = @recruit.resume_lists.build(resume_list_params)
    if @resume_list.save!
      redirect_to resume_list_path(@resume_list), notice: '申請成功'
    else
      render :new
    end
  end

  def edit; end

  def update
  end

  def approve
    @recruit = @resume_list.recruit
    @band = @recruit.band
    @role = @resume_list.role
    @user = @resume_list.user
    new_band_member = @band.band_members.new(user: @user, identity: :member, role: @role)
    if new_band_member.save
      @resume_list.update(status: :approved)
      redirect_to recruit_path(@recruit)
    else
      flash[:alert] = 'Failed to approve resume list.'
      render :show
    end
  end

  def reject
    @resume_list.update(status: :rejected)
  end

  private

  def set_recruit_id
    @recruit = Recruit.find(params[:recruit_id])
  end

  def set_resume_list
    @resume_list = ResumeList.find(params[:id])
  end

  def resume_list_params
    params.require(:resume_list).permit(:user_id, :description, :role)
  end
end
