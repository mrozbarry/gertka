class StopsController < ApplicationController
  respond_to :json
  def index
    Rails.logger.info "SETTING: [#{params[:longitude]}, #{params[:latitude]}], #{params[:distance]}"

    @stops = if params[:route]
      Stop.busses_soon(params[:route])
    else
      Stop.busses_today
    end.near([params[:latitude].to_f, params[:longitude].to_f], (params[:distance] || 10).to_f, {:units => :km})
  end
end
