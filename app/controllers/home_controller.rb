class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end
  
  def settings
    @settings = { :default_zoom => 20, :remember_trip => true, :query_delay => 30000 }
    @settings = session[:settings] unless session[:sessings].nil?
    render :layout => false
  end
end
