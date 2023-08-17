# frozen_string_literal: true

class PagesController < ApplicationController
  
  def index; end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
