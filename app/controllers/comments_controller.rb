# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: %i[create destroy]
  def create
    @comment = @commentable.comments.build(comment_params)
    @comments = @commentable.comments
  if @comment.save
     comment_route()
    else 
      comment_fail()
    end
  end  

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    comment_delete()
  end

  private
  def find_commentable
    if params[:resume_list_id]
      @commentable = ResumeList.find(params[:resume_list_id])
    elsif params[:activity_id]
      @commentable = Activity.find(params[:activity_id])
    elsif params[:post_id]
      @commentable = Post.find(params[:post_id])
    end
  end
  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user: current_user, commentable: @commentable)
  end

  def comment_route
    if @commentable.is_a?(Post)
      if @commentable.channel.present?
        redirect_to channel_path(@commentable.channel.id), notice: '留言成功'
      else
        redirect_to posts_path, notice: '留言成功'
      end
    elsif
      @commentable.is_a?(Activity)
      redirect_to activity_path(@commentable), notice: '留言成功'
    elsif
      @commentable.is_a?(Channel)
      redirect_to channel_path(@commentable), notice: '留言成功'
    elsif
      @commentable.is_a? (ResumeList)
      redirect_to resume_list_path(@commentable), notice: '留言成功'
    end  
  end  

  def comment_delete
    if @commentable.is_a?(Post)
      if @commentable.channel.present?
        redirect_to channel_path(@commentable.channel.id), notice: '刪除成功'
      else
        redirect_to posts_path, notice: '刪除成功'
      end
    elsif
      @commentable.is_a?(Activity)
      redirect_to activity_path(@commentable), notice: '刪除成功'
    elsif
      @commentable.is_a?(Channel)
      redirect_to channel_path(@commentable), notice: '刪除成功'
    elsif
      @commentable.is_a? (ResumeList)
      redirect_to resume_list_path(@commentable), notice: '刪除成功'
    end  
  end  
  def comment_fail
    if @commentable.is_a?(Post)
      redirect_to posts_path, alert: '留言不得為空白'
    elsif
      @commentable.is_a?(Activity)
      redirect_to activity_path(@commentable), alert: '留言不得為空白'
    elsif
      @commentable.is_a?(Channel)
      redirect_to channel_path(@commentable), alert: '留言不得為空白'
    elsif
      @commentable.is_a? (ResumeList)
      redirect_to resume_list_path(@commentable), alert: '留言不得為空白'
    end  
  end  
end