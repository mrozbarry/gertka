class Shape < ActiveRecord::Base
  attr_accessible :shape_dist_traveled, :shape_id, :shape_pt_lat, :shape_pt_lon, :shape_pt_sequence
end
