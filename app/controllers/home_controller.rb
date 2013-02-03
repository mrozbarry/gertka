class HomeController < ApplicationController
  def index
    @settings = session[:settings] || { :default_zoom => 20, :remember_trip => true, :query_delay => 30000 }
    respond_to do |format|
      format.html
    end
  end
  
  def settings
    @settings = session[:settings] || { :default_zoom => 20, :remember_trip => true, :query_delay => 30000, :faves => [] }
    render :layout => false
  end
  
  def updates
    session[:settings][:default_zoom] = params[:default_zoom] if params[:default_zoom] 
    session[:settings][:remember_trip] = params[:remember_trip] if params[:remember_trip]
    session[:settings][:query_delay] = params[:query_delay] if params[:query_delay]
    session[:settings][:faves] = [] if params[:reset_faves]
    session[:settings][:faves] += params[:new_fav] if params[:new_fav]
    render :layout => false
  end

end
