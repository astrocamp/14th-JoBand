# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_commentable, only: %i[create destroy]

  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to @commentable
    else
      redirect_to @commentable, alert: '留言不得為空白'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @commentable
  end

  private

  def find_commentable
    @commentable = ResumeList.find(params[:resume_list_id])
  end

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user: current_user)
  end
end
