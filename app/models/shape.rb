class Shape < ActiveRecord::Base
  reverse_geocoded_by :shape_pt_lat, :shape_pt_lon
end
