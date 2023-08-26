class ResumeListsController < ApplicationController
  before_action :set_recruit_id,  only: %i[new create]
  before_action :set_resume_list, only: %i[show edit update destroy]

  def show; end

  def new
    @resume_list = ResumeList.new
  end

  def create
    @resume_list = @recruit.resume_lists.build(resume_list_params)
    if @resume_list.save
      redirect_to resume_list_path(@resume_list), notice: 'Resume list was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    # if @resume_list.update(resume_list_params)
    #   redirect_to resume_list_path(@resume_list), notice: '編輯成功'
    # else
    #   render :edit
    # end
  end

  def destroy
    # @resume_list.destroy
    # redirect_to recruit_path(@band, @recruit), notice: '已刪除'
  end

  private

  def set_recruit_id
    @recruit = Recruit.find(params[:recruit_id])
  end

  def set_resume_list
    @resume_list = ResumeList.find(params[:id])
  end

  def resume_list_params
    params.require(:resume_list).permit(:description, :role, :status)
  end
end
