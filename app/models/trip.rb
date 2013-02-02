class Trip < ActiveRecord::Base
  attr_accessible :block_id, :route_id, :service_id, :shape_id, :trip_headsign, :trip_id
  has_many :stop_times
  has_many :shapes
  
end
