class StopTime < ActiveRecord::Base
  attr_accessible :arrival_time, :departure_time, :dropoff_type, :pickup_type, :shape_dist_traveled, :stop_headsign, :stop_id, :stop_sequence, :trip_id
  has_one :trip
end
