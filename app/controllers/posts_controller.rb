# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_post, only: %i[show destroy]

  def index
    @post = Post.new
    @comment = @post.comments.new
    @posts = Post.includes(:like_logs).all.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to posts_path, notice: '貼文已發佈！'
    else
      redirect_to posts_path, alert: '貼文失敗。'
    end
  end

  def show; end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, notice: '貼文已刪除！'
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
