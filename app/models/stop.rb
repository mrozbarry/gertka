class Stop < ActiveRecord::Base
  attr_accessible :location_type, :stop_desc, :stop_id, :stop_lat, :stop_lon, :stop_name, :zone_id
end
