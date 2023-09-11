# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_user!

      def like
        post = Post.find(params[:id])
        liked = current_user.liked?(post)

        if liked
          current_user.unlike!(post)
        else
          current_user.like!(post)
        end
        render json: { liked: !liked }
      end
    end
  end
end
