class StopsController < ApplicationController
  respond_to :json
  def index
    Rails.logger.info "SETTING: [#{params[:longitude]}, #{params[:latitude]}], #{params[:distance]}"
    @stops = Stop.busses_today.near([params[:latitude].to_f, params[:longitude].to_f], (params[:distance] || 10).to_f, {:units => :km})


    result = []
    @stops.each do |stop|
      stop_times = stop.stop_times.where(:arrival_time => [Time.zone.now - 5.hours .. Time.zone.now - 4.hour])
      stop_times_hash = []
      stop_times.each do |stop_time|
        stop_times_hash << {
          :trip_id => stop_time.trip_id,
          :arrival_time => stop_time.arrival_time,
          :departure_time => stop_time.departure_time,
          :stop_id => stop_time.stop_id,
          :stop_sequence => stop_time.stop_sequence,
          :stop_headsign => stop_time.stop_headsign,
          :pickup_type => stop_time.pickup_type,
          :drop_off_type => stop_time.drop_off_type,
          :shape_dist_traveled => stop_time.shape_dist_traveled
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
