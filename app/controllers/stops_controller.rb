class StopsController < ApplicationController
  respond_to :json
  def index
    Rails.logger.info "SETTING: [#{params[:longitude]}, #{params[:latitude]}], #{params[:distance]}"
    @stops = Stop.busses_today.near([params[:longitude], params[:latitude]], params[:distance], {:units => :km})
  end
end
