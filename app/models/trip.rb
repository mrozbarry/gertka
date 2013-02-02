class Trip < ActiveRecord::Base
  has_many :stop_times
  has_many :shapes
  belongs_to :calendar, :primary_key => :service_id, :foreign_key => :service_id
  has_one :route, :primary_key => :route_id, :foreign_key => :route_id
end
