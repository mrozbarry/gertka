class StopsController < ApplicationController
  respond_to :json
  def index
    Rails.logger.info "SETTING: [#{params[:longitude]}, #{params[:latitude]}], #{params[:distance]}"

    @stops = if params[:route]
      Stop.route_soon(params[:route])
    else
      Stop.busses_today
    end.near([params[:latitude].to_f, params[:longitude].to_f], (params[:distance] || 2).to_f, {:units => :km})


    result = []
    @stops.each do |stop|
      stop_times = stop.stop_times.includes(:trip).select([:arrival_time, 'trip.route_id']).where(:arrival_time => [Time.zone.now - 5.hours .. Time.zone.now - 4.hour])
      stop_times_hash = []
      stop_times.each do |stop_time|
        stop_times_hash << {
          :route_id => stop_time.trip.try(:route_id),
          :arrival_time => stop_time.arrival_time
        }
      end
      result << {
        :latitude => stop.stop_lat,
        :longitude => stop.stop_lon,
        :zone_id => stop.zone_id,
        :stop_id => stop.stop_id,
        :description => stop.stop_desc,
        :name => stop.stop_name,
        :type => stop.location_type,
        :stop_times => stop_times_hash
      }
    end
    render :json => result.to_json

  end
end
