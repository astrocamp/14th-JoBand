# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_post, only: %i[show destroy]

  def index
    @post = Post.new
    @comment = @post.comments.new
    @posts = Post.includes(:like_logs).where(channel_id: nil).order(created_at: :desc)
    @activity = Activity.with_attached_banner.sample
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      if @post.channel_id.present?
        redirect_to channels_path, notice: t("post.posted")
      else
        redirect_to posts_path, notice: t("post.posted")
      end
    else
      redirect_to posts_path, alert: t("post.fail")
    end
  end

  def show; end

  def destroy
    authorize @post
    @post.destroy
    if @post.channel.present?
      redirect_to channel_path(@post.channel), notice: t("post.deleted")
    else
      redirect_to posts_path, notice: t("post.deleted")
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :channel_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
