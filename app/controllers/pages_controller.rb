# frozen_string_literal: true

class PagesController < ApplicationController
  def index; end

  def about; end

  def robots
    robots = File.read(Rails.root + "config/robots.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end
end
