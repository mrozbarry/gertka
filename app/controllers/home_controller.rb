class HomeController < ApplicationController
  def index
    @settings = session[:settings] || { :default_zoom => 20, :remember_trip => true, :query_delay => 30000 }
    respond_to do |format|
      format.html
    end
  end
  
  def settings
    @settings = session[:settings] || { :default_zoom => 20, :remember_trip => true, :query_delay => 30000 }
    render :layout => false
  end
end
