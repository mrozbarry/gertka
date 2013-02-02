class StopsController < ApplicationController
  respond_to :json
  def index
    Rails.logger.info "SETTING: [#{params[:longitude]}, #{params[:latitude]}], #{params[:distance]}"
    @stops = Stop.busses_today.near([params[:latitude].to_f, params[:longitude].to_f], (params[:distance] || 10).to_f, {:units => :km})
  end
end
