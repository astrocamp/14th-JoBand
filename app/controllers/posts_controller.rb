class PostsController < ApplicationController

  def index
    
  end

  def create
  
  end

  def show
  end

  def destory
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end

end
