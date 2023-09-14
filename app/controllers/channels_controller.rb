# frozen_string_literly: true

class ChannelsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_channel, only: %i[show destroy]

  def show
    @post = Post.new
    @comment = @post.comments.new
    @channels = Post.includes(:like_logs).where(channel_id: @channel.id).order(created_at: :desc)
    @activity = Activity.with_attached_banner.sample
  end

  def create
    @post = Post.new(channel_params)
    authorize @post
    if @post.save
      redirect_to channel_path(band.channel), notice: '貼文已發佈！'
    else
      redirect_to channel_path(band.channel), alert: '貼文失敗。'
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, notice: '貼文已刪除！'
  end


  private

  def channel_params
    params.require(:channel).permit(:body, :id)
  end

  def set_channel
    @channel = Channel.find(params[:id])
  end
end
