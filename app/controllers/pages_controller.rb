class PagesController < ApplicationController
  def home
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def about
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
